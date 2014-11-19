all: clean
	npm install
	node bin/newevents.js
	punch g

clean:
	rm -rf output

deploy: all
	# Publishing to http://hackerspace.sg.s3-website-ap-southeast-1.amazonaws.com/
	# Assuming ~/s3cfg-secret with hsgweb credentials
	s3cmd -P -c ~/s3cfg-secret -rr --delete-removed sync output/ s3://hackerspace.sg/

.PHONY: all clean deploy
