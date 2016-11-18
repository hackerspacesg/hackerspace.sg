all:
	npm install
	node bin/newevents.js
	$(shell npm bin)/punch g

azure:
	# Deprecated as of 20 Oct 2016
	newout:= output-$(shell date +%s)
	oldout:= $(shell readlink www)
	npm install
	node bin/newevents.js
	$(shell npm bin)/punch g
	mv output "$(newout)"
	ln -sf "$(newout)" "lnk-$(newout)"
	mv -T "lnk-$(newout)" www
	rm -rf "$(oldout)"

azure-clean:
	# Deprecated as of 20 Oct 2016
	rm -rf www output*

s3-deploy: all
	# Publishing to http://hackerspace.sg.s3-website-ap-southeast-1.amazonaws.com/
	# Assuming /var/www/s3cfg-secret with hsgweb credentials
	s3cmd -P -c /var/www/s3cfg-secret -rr --delete-removed sync www/ s3://hackerspace.sg/

.PHONY: all azure azure-clean s3-deploy