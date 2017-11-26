# 'ff' command -- find string in files with a specified suffix
ff() {
  [[ -n $1 && -n $2 ]] || {
    echo "Usage $0 [suffix] [string]"
    echo "Where"
    echo "  suffix  file suffix (without wildcards)"
    echo "  string  string to search for (quote if spaces)"
    return
  }
  find . -type f -name \*$1 -exec grep --color=always -Hn $2 "{}" \; | less -RFX
}
