#!/bin/sh

cat <<END
Cache-Control: no-cache
Content-Type: text/plain

END

git pull
punch g

printenv | mail -s "Triggered update" hendry
