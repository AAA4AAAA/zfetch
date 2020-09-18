zfetch() {
    local distro=$(uname -o) \
          kern="$(uname -r | cut -d- -f1)" \
          sh="${SHELL##*/}" \
          term="${TERM%-*}"

    if [[ $distro == GNU/Linux ]]; then
        distro="$(grep '^ID=' /etc/*release | cut -d= -f2)"
    fi

    if [[ $TERM != xterm-256color && $TERM =~ xterm-* ]]; then
        printf 'term: %8s\n' "${TERM##*-}"
    fi

    (
        printf '%-4s %8s\n' \
               'os'   "$distro" \
               'kern' "$kern" \
               'sh'   "$sh" \
               'term' "$term"
    ) | zbox 1
}
