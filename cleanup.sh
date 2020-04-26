#!/bin/bash

git-mv-with-history \
redirects=content/_redirects \
bin/newevents.js=content/_data/newevents.js \
templates/cupcake/=content/ \
templates/membership/=content/ \
templates/old-hardware/=content/ \
contents/index.json=content/_data/index.json \
contents/shared.json=content/_data/shared.json \
contents/2013/proposalA/_index/main.markdown=content/2013/proposalA.md \
contents/about/_index/main.markdown=content/about/index.md \
contents/calendar/_index/main.markdown=content/calendar/index.md \
contents/connect/_index/main.markdown=content/connect/index.md \
contents/cupcake/_index/main.md=content/cupcake/index.md \
contents/DevBoards/_index/main.md=content/DevBoards/index.md \
contents/events/_index/main.markdown=content/events/index.md \
contents/events/eoy2015/_index/main.markdown=content/events/eoy2015.md \
contents/faq/_index/main.markdown=content/faq/index.md \
contents/location/_index/main.markdown=content/location/index.md \
contents/membership/_index/main.markdown=content/membership/index.md \
contents/old-hardware/_index/main.md=content/old-hardware/index.md \
contents/plenum/_index/main.md=content/plenum/index.md \
contents/plenum/2014-02-12/_index/main.md=content/plenum/2014-02-12.md \
contents/plenum/2014-04-03/_index/main.md=content/plenum/2014-04-03.md \
contents/plenum/2014-06-21/_index/main.md=content/plenum/2014-06-21.md \
contents/plenum/2015-01-15/_index/main.md=content/plenum/2015-01-15.md \
contents/plenum/2017-10-31/_index/main.md=content/plenum/2017-10-31.md \
contents/plenum/2017-11-14/_index/main.md=content/plenum/2017-11-14.md \
contents/plenum/2017-11-28/_index/main.md=content/plenum/2017-11-28.md \
contents/plenum/2018-01-16/_index/main.md=content/plenum/2018-01-16.md \
contents/plenum/2018-02-12/_index/main.md=content/plenum/2018-02-12.md \
contents/plenum/2018-03-14/_index/main.md=content/plenum/2018-03-14.md \
contents/plenum/2018-04-12/_index/main.md=content/plenum/2018-04-12.md \
contents/plenum/2018-04-25/_index/main.md=content/plenum/2018-04-25.md \
contents/plenum/2018-05-17/_index/main.md=content/plenum/2018-05-17.md \
contents/plenum/2018-06-20/_index/main.md=content/plenum/2018-06-20.md \
contents/plenum/2018-07-11/_index/main.md=content/plenum/2018-07-11.md \
contents/plenum/2018-08-23/_index/main.md=content/plenum/2018-08-23.md \
contents/plenum/2018-10-17/_index/main.md=content/plenum/2018-10-17.md \
contents/plenum/2018-11-21/_index/main.md=content/plenum/2018-11-21.md \
contents/plenum/2018-12-19/_index/main.md=content/plenum/2018-12-19.md \
contents/plenum/2019-01-16/_index/main.md=content/plenum/2019-01-16.md \
contents/plenum/2019-03-06/_index/main.md=content/plenum/2019-03-06.md \
contents/plenum/2019-04-10/_index/main.md=content/plenum/2019-04-10.md \
templates/imgs/bussorahfw.jpg=content/events/ \
templates/imgs/bussorahfws.jpg=content/events/ \
templates/imgs/bussorahfwl.jpg=content/events/ \
templates/imgs/calendar_1.jpg=content/calendar/ \
templates/imgs/calendar.jpg=content/calendar/ \
templates/imgs/index.jpg=content/index/ \
templates/imgs/membership.jpg=content/membership/ \
templates/imgs/membership_1.jpg=content/membership/ \
templates/imgs/membership_2.jpg=content/membership/ \
templates/imgs/membership_3.jpg=content/membership/ \
templates/imgs/membership_4.jpg=content/membership/ \
templates/_footer.mustache=content/_includes/footer.mustache \
templates/_header.mustache=content/_includes/header.mustache \
templates/_layout.mustache=content/_includes/layout.mustache \
templates/_navbar.mustache=content/_includes/navbar.mustache \
templates/index.mustache=content/index/index.mustache \
templates/css/=content/ \
templates/css/styles.less=content/css/styles.scss \
templates/js/=content/ \
templates/imgs/=content/img \
templates/favicon.ico=content/favicon.ico

bfg --no-blob-protection --delete-folders apache
bfg --no-blob-protection --delete-folders bin
bfg --no-blob-protection --delete-folders contents
bfg --no-blob-protection --delete-folders sponsor-mockup-design
bfg --no-blob-protection --delete-folders templates
bfg --no-blob-protection --delete-files .travis.yml
bfg --no-blob-protection --delete-files htaccess
bfg --no-blob-protection --delete-files Makefile

git filter-branch --prune-empty
