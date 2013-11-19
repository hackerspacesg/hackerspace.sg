#!/bin/sh
POST=$(</dev/stdin)
exec 2>&1
cat <<END
Cache-Control: no-cache
Content-Type: text/plain

END

umask 002
git pull
git checkout -f
punch g

echo $POST | mail -s "HSG update" hendry
