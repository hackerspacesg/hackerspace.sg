#!/bin/sh

cat <<END
Cache-Control: no-cache
Content-Type: text/plain

END

umask 002
git pull
punch g

printenv | mail -s "Triggered update" hendry
