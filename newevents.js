var ical = require('ical');
var urlRegexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;

ical.fromURL('https://www.google.com/calendar/ical/mengwong%40hackerspace.sg/public/basic.ics', {},
function(err, data) {
	var futureEvents = [];
	for (var k in data) {
		if (data.hasOwnProperty(k)) {
			var ev = data[k]
			if (ev.start && ! isNaN(ev.start) && (ev.start > Date.now())) {
				var e = {
					"Name": ev.summary,
					"When": ev.start.getTime()
				}

				if (ev.url && ev.url.indexOf("http") == 0) {
					e["URL"] = ev.url;
				}else{
					// If no URL is found, try to extract a string
					// from the description.
					urlFromDesc = ev.description.match(urlRegexp);
					if (urlFromDesc && urlFromDesc[0])
						e["URL"] = urlFromDesc[0];
				}
				futureEvents.push(e);
			}
		}
	}
	if (!futureEvents) {
		return;
	}

	futureEvents.sort(function(a, b) {
		var keyA = new Date(a.When),
		keyB = new Date(b.When);
		// Compare the 2 dates
		if (keyA < keyB) return - 1;
		if (keyA > keyB) return 1;
		return 0;
	});

	var j = JSON.stringify(futureEvents, undefined, 2);

	var fs = require('fs');
	fs.writeFile("contents/_index/events.json", j, function(err) {
		if (err) {
			console.log(err);
		}
	});
});

