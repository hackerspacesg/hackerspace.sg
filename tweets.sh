#!/bin/bash
count=6
while IFS='|' read id date tweet
do
	test "${tweet:0:1}" == "@" && continue
	test "$count" -gt 0 || exit 0
	let "count-=1"
	echo "<li>"
	echo $tweet | sed -e 's_\(http\|https\|ftp\)://[^ \t]\+_<a href="&">&</a>_'
	echo "&nbsp;&mdash;<br>"
	echo '<a href="http://twitter.com/hackerspacesg/status/'$id'"><abbr class="timeago" title="'$date'">'$date'</abbr></a>'
	echo "</li>"
done < hackerspacesg.txt
