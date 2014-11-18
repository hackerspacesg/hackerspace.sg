all: clean
	npm install
	node bin/newevents.js
	punch g

clean:
	rm -rf output
