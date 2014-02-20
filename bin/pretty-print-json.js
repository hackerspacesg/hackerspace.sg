#!/usr/bin/node

/* Open stdin for pipes*/
var data = "";
var stdin = process.openStdin();

stdin.on('data', function(chunk) {
	data += chunk;
});

stdin.on('end', main);

function main() {
	  console.log(JSON.stringify(JSON.parse(decodeURIComponent(data.toString())), null, 4));
}
