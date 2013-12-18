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
	hsgEvents.forEach(function(thisEvent){
		if (thisEvent.gd$when){
			var timeString = thisEvent.gd$when[0].startTime;
			if (Date.parse(timeString) > Date.now()){
				futureEvents.push({"Name" : thisEvent.title.$t, "When" :  timeString});
			}
		}
	});
	console.log(futureEvents);
}
