export actions=(
  "finder Open in Finder"
  "ghostty Open in Ghostty"
  "code Open in VS Code"
  "zed Open in Zed"
)

function finder() {
  open -a Finder "$1"
}
