all:
	curl -s "https://www.google.com/calendar/feeds/mengwong%40hackerspace.sg/public/full?alt=json" | node newevents.js > contents/_index/events.json
	punch g

refresh:
	curl http://greptweet.com/f/hackerspacesg

hackerspacesg.txt: refresh
	wget -q -N http://greptweet.com/u/hackerspacesg/hackerspacesg.txt -O hackerspacesg.txt

contents/_index/tweets.mdwn: hackerspacesg.txt
	./tweets.sh > contents/_index/tweets.markdown
