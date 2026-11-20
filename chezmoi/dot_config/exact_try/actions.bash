export actions=(
  "finder Open in Finder"
  "ghosttyapp Open in Ghostty"
  "rexapp Open in Rex"
  "code Open in VS Code"
  "zed Open in Zed"
)

function finder() {
  open -a Finder "$1"
}

function ghosttyapp() {
  open -a Ghostty "$1"
}

function rexapp() {
  open -a "Rex Beta" "$1"
}
