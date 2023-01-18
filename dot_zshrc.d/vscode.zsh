search_dirs=(
  "$HOME/Applications/Visual Studio Code.app"
  "/Applications/Visual\ Studio\ Code.app"
)

VSCODE_FOUND=0

for dir in $search_dirs; do
  if [[ -d $dir ]]; then
    alias code="'$dir/Contents/Resources/app/bin/code' --user-data-dir $HOME/.vscode"

    VSCODE_FOUND=1
    break
  fi
done

if [[ $VSCODE_FOUND -ne 1 ]]; then
  >&2 echo "Visual Studio Code installation not found"
fi
