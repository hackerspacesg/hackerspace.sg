#!/usr/bin/node

var accum = require('accum');
process.stdin.pipe(accum(function (data) {
	  console.log(JSON.stringify(JSON.parse(decodeURIComponent(data.toString())), null, 4));
}));
