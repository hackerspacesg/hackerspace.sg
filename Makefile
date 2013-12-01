all:
	curl -s "https://www.google.com/calendar/feeds/mengwong%40hackerspace.sg/public/full?alt=json" > contents/_index/events.json
	punch g
