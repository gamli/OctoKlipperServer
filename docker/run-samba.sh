docker run --rm -it -p 139:139 -p 445:445 -d dperson/samba -p \
           -u "mdibo;mdibo" \
           -s "home;/mount"
