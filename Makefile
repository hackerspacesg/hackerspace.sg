newout:= output-$(shell date +%s)
oldout:= $(shell readlink www)

all:
	npm install
	node bin/newevents.js
	punch g
	mv output $(newout)
	ln -sfT $(newout) www
	test -d $(oldout) && rm -rf $(oldout)

clean:
	rm -rf output* www

deploy: all
	# Publishing to http://hackerspace.sg.s3-website-ap-southeast-1.amazonaws.com/
	# Assuming /var/www/s3cfg-secret with hsgweb credentials
	s3cmd -P -c /var/www/s3cfg-secret -rr --delete-removed sync www/ s3://hackerspace.sg/

.PHONY: all clean deploy
