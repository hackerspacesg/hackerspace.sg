#!/bin/sh
export NODE_PATH=/usr/lib/node_modules/ # for ./pretty-print.js

POST=$(</dev/stdin)
exec 2>&1
cat <<END
Cache-Control: no-cache
Content-Type: text/plain

END

umask 002
git fetch origin
git reset --hard origin/master
punch g

echo $POST | sed -n '/^payload=/s///p' | ./pretty-print.js | mail -s "HSG update" hendry
