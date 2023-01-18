function pass-signin() {
  op whoami >/dev/null 2>&1
  [[ $? != 0 ]] && eval $(op signin)
}

function pass() {
  set -o pipefail

  pass-signin

  op read op://Private/$1/password 2>/dev/null | pbcopy

  if [ $? != 0 ]; then
    >&2 echo "Password not found for $1"
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