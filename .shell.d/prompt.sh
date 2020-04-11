# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles

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
$wht on $ylw\$(git-ref)
$wht\$ $rst"
export PS1

PS2="$wht> $rst"
export PS2
