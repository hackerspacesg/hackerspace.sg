all:
	npm install
	node src/newevents.js
	punch g

refresh:
	curl http://greptweet.com/f/hackerspacesg

hackerspacesg.txt: refresh
	wget -q -N http://greptweet.com/u/hackerspacesg/hackerspacesg.txt -O hackerspacesg.txt

contents/_index/tweets.mdwn: hackerspacesg.txt
	./src/tweets.sh > contents/_index/tweets.markdown
