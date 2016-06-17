top() {
    watch -tn 1 uptime \; ps -exk -%cpu -o pid,ppid,user,vsz,rss,%cpu,%mem,stat,args \| awk \''{ if ($9!="watch") print $1,$2,$3,$4,$5,$6,$7,$8,$9 }'\' \| column -t \| cut -b-\$\(tput cols\)
}
