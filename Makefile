all:
	npm install
	node bin/newevents.js
	punch g

	# atomically replace output symlink
	ln -fsT output-new output-lnk
	mv -T output-lnk output

	# update output-current
	rsync --delete -a --no-times output-new/ output-current/

	# atomically replace output symlink
	ln -fsT output-current output-lnk
	mv -T output-lnk output
	rm -rf output-new

clean:
	rm -rf output*

deploy: all
	# Publishing to http://hackerspace.sg.s3-website-ap-southeast-1.amazonaws.com/
	# Assuming /var/www/s3cfg-secret with hsgweb credentials
	s3cmd -P -c /var/www/s3cfg-secret -rr --delete-removed sync output/ s3://hackerspace.sg/

.PHONY: all clean deploy
