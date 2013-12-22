var ical = require('ical');

ical.fromURL('https://www.google.com/calendar/ical/mengwong%40hackerspace.sg/public/basic.ics', {},
function(err, data) {
	var futureEvents = [];
	for (var k in data) {
		if (data.hasOwnProperty(k)) {
			var ev = data[k]
			if (ev.start && ! isNaN(ev.start) && (ev.start > Date.now())) {
				futureEvents.push({
					"Name": ev.summary,
					"When": ev.start.getTime()
				});
			}
		}
	}
	if (!futureEvents) {
		return;
	}
	var j = JSON.stringify(futureEvents, undefined, 2);

	var fs = require('fs');
	fs.writeFile("contents/_index/events.json", j, function(err) {
		if (err) {
			console.log(err);
		}
	});
});

