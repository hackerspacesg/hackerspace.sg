#!/usr/bin/env node


/*Requires
Commander - input parsing etc.
Request - HTTP request.

Can be installed using npm

npm install commander
npm install request

*/
var program = require('commander');
var request = require('request');

/* Commander  Stuff*/
program
.version('0.0.1')
.option('-i, --input <path>', 'Input GCal JSON file')
.parse(process.argv);

if (!program.input){
	console.log('error: option \'-i, --input <path>\' is mandatory ');
	program.outputHelp();
	return;
}

// Get JSON form GCal
request(program.input, function (error, response, body) {
	if (!error && response.statusCode == 200) {
		var hsgEvents = JSON.parse(body).feed.entry;
		var futureEvents = [];
		hsgEvents.map(function(cEvent){
			if (cEvent.gd$when){
				var timeStr = cEvent.gd$when[0].startTime;
				if (Date.parse(timeStr) > Date.now()){
					futureEvents.push({"Name" : cEvent.title.$t, "When" :  timeStr});
				}
			}
		});
	}
	console.log(futureEvents);
});
