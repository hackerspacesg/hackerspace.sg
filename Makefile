all:
	curl -s "https://www.google.com/calendar/feeds/mengwong%40hackerspace.sg/public/full?alt=json" | go run newevents.go > contents/_index/events.json
	punch g
