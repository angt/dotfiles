# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles

shell_prompt_git() {
    git symbolic-ref --quiet --short HEAD 2> /dev/null ||
    git rev-parse --short HEAD 2> /dev/null ||
    echo '(none)'
}

bld="\\[\\e[1m\\]"
rst="\\[\\e[0m\\]"
red="\\[\\e[31m\\]"
grn="\\[\\e[32m\\]"
ylw="\\[\\e[33m\\]"
blu="\\[\\e[34m\\]"
mgt="\\[\\e[35m\\]"
wht="\\[\\e[37m\\]"

userStyle="$mgt"
hostStyle="$blu"

[ "$USER" == "root" ] && userStyle="$red"
[ "$SSH_TTY"        ] && hostStyle="$red"

PS1="
$bld$userStyle\\u\
$wht at $hostStyle\\h\
$wht in $grn\\w\
$wht on $ylw\$(shell_prompt_git)
$wht\$ $rst"
export PS1

PS2="$wht> $rst"
export PS2
