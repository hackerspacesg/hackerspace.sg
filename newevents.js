#!/usr/bin/env node

var program = require('commander');

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

var request = require('request');

request(program.input, function (error, response, body) {
	if (!error && response.statusCode == 200) {
		var hsgEvents = JSON.parse(body).feed.entry;
		var outEvents = [];
		hsgEvents.map(function(currentEvent, index){
			//console.log("Parsing " + index + " which is " + currentEvent.title.$t);
			if (currentEvent.gd$when){
				var startTimeString = currentEvent.gd$when[0].startTime;
				//console.log(startTimeString);
				if (new Date(startTimeString) > Date.now()){
					outEvents.push({"Name" : currentEvent.title.$t, "When" :  startTimeString});
				}
			}
		});
	}
	console.log(outEvents);
});
