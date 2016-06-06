# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles

prompt_git() {
    git symbolic-ref --quiet --short HEAD 2> /dev/null ||
    git rev-parse --short HEAD 2> /dev/null ||
    echo '(none)'
}

bold="\[\e[1m\]"
reset="\[\e[0m\]"
black="\[\e[30m\]"
red="\[\e[31m\]"
green="\[\e[32m\]"
yellow="\[\e[33m\]"
blue="\[\e[34m\]"
magenta="\[\e[35m\]"
cyan="\[\e[36m\]"
white="\[\e[37m\]"

userStyle="${magenta}"
hostStyle="${blue}"

[ "${USER}" == "root" ] && userStyle="${red}"
[ -n "${SSH_TTY}" ] && hostStyle="${red}"

PS1="
${bold}${userStyle}\u\
${white} at ${hostStyle}\h\
${white} in ${green}\W\
${white} on ${yellow}\$(prompt_git)
${white}\$ ${reset}"
export PS1

PS2="${white}> ${reset}"
export PS2
