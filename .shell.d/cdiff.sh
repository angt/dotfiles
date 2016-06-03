if hash git &>/dev/null; then
    cdiff() {
        git diff --no-index --color-words $*
    }
fi
