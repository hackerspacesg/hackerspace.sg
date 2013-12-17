#!/usr/bin/env node

var request = require('request');

/* Commander  Stuff*/
var stdin = process.openStdin();
var data = "";

stdin.on('data', function(chunk) {
  data += chunk;
});

stdin.on('end', function() {
	console.log("got all data");
	var hsgEvents = JSON.parse(data).feed.entry;
	var futureEvents = [];
	hsgEvents.map(function(cEvent){
		if (cEvent.gd$when){
			var timeStr = cEvent.gd$when[0].startTime;
			if (Date.parse(timeStr) > Date.now()){
				futureEvents.push({"Name" : cEvent.title.$t, "When" :  timeStr});
			}
		}
	});
	console.log(futureEvents);
});
