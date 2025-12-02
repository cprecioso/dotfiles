(( ${#ABBR_REGULAR_USER_ABBREVIATIONS} )) && {
  ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
  ZSH_HIGHLIGHT_REGEXP=('^[[:blank:][:space:]]*('${(j:|:)${(Qk)ABBR_REGULAR_USER_ABBREVIATIONS}}')$' fg=blue)
  ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]('${(j:|:)${(Qk)ABBR_GLOBAL_USER_ABBREVIATIONS}}')$' fg=blue)
}