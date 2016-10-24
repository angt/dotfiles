gh_addmykey() {
    curl -i --user "$1" \
        -d "{\"title\": \"$USER-$(hostname)\",\"key\":\"$(cat .ssh/id_rsa.pub)\"}" \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        https://api.github.com/user/keys
}
