function pass-signin() {
  op whoami >/dev/null 2>&1
  [[ $? != 0 ]] && eval $(op signin)
}

function pass-list() {
  pass-signin

  out=$(op item list \
    --categories Login \
    --vault Private \
    --format json | jq -r '.[].title' | sort | sed -e 's/^/  * /')

  echo "Available passwords:"
  echo $out
}

function pass() {
  set -o pipefail

  pass-signin

  if [[ $1 = "" ]]; then
    pass-list
    return 1
  fi

  op read -n op://Private/$1/password 2>/dev/null | pbcopy

  if [ $? != 0 ]; then
    >&2 echo "Password not found for $1"

    echo

    pass-list
    return 1
  else
    echo "Password copied to clipboard"
  fi
}

function pass-create() {
  pass-signin

  op item create \
    --category=login \
    --vault=Private \
    --generate-password='16,letters,digits,symbols' \
    --title="$1" >/dev/null 2>&1

  if [ $? = 0 ]; then
    pass $1
  else
    >&2 echo "Could not save password"
    return 1
  fi
}
