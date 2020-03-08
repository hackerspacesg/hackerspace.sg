var fs = require('fs');

module.exports = {

	run: function(path, options, callback) {
		var modified = options.modified || false;
		var finished = options.finished || false;

		// Empty path means it's the last thing it does
		if (!path) {
			fs.createReadStream('redirects').pipe(fs.createWriteStream('output/_redirects'));
		}

		return callback();
	}

};
