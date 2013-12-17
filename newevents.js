#!/usr/bin/env node

/* Open stdin for pipes*/
var data = "";
var stdin = process.openStdin();

stdin.on('data', function(chunk) {
  data += chunk;
});

stdin.on('end', main);

/*Main event filtering logic*/
function main () {
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
}
