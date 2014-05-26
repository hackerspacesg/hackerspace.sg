# Hackerspace.SG Website [![Build Status](https://travis-ci.org/notthetup/hackerspace.sg.png)](https://travis-ci.org/notthetup/hackerspace.sg)

>Hackerspace.SG is Singapore's very own Hackerspace. 
>
>There are hundreds of such [hackerspaces](http://www.hackerspaces.org/) around the world, where people with common interests in computers, technology, science, digital and electronic art, come together to meet, socialise and collaborate.
>
>Built by and for geeks, nerds, inventors, engineers, and entrepreneurs, Hackerspace.SG is the Singapore hacker community's home, living room and laboratory.  Come hang out with the community in the evenings.  Co-work with us during the day.  We also host regular events, meetups, presentations, workshops, and movie nights for the local community.

# Managing content

## Setup

1. [Sign up](https://github.com/join) for a GitHub account
1. [Create a fork](https://github.com/hackerspacesg/hackerspace.sg/fork) of the repository ([doc](https://help.github.com/articles/fork-a-repo))
1. You may edit files via the web-based [GitHub editor](https://help.github.com/articles/editing-files), with a desktop client, or with the [command-line interface](http://gitref.org/)
    * Clients include:
      * Official GitHub client ([Mac](https://mac.github.com/) and [Windows](https://windows.github.com/))
      * [SourceTree](http://www.sourcetreeapp.com/) (Mac and Windows)
      * [SmartGit](http://www.syntevo.com/smartgithg/) (Mac, Linux and Windows)
      * [gitg](https://github.com/jessevdk/gitg) (Linux)

GitHub has [awesome documentation](https://help.github.com/).

## Adding and editing content

Hackerspace.SG prefers the [fork and pull](https://help.github.com/articles/using-pull-requests#fork--pull) model of collaboration. Content is stored in the [/contents](https://github.com/hackerspacesg/hackerspace.sg/tree/master/contents) directory, in [Markdown files](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

All new commits should first be pushed to your own fork of the repository, and then requested to be merged via a [pull request](https://github.com/hackerspacesg/hackerspace.sg/compare/). Read about [the workflow](https://guides.github.com/introduction/flow/).

Pull requests merge one particular branch with another. If you're editing multiple aspects of the website at once, please create [multiple branches](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository), and file separate pull requests for each individual aspect.

We use [Punch](https://github.com/laktek/punch/wiki) as our content management system.

## Testing the site locally

[node.js](http://nodejs.org/) is required. Punch is installable via the [node.js package manager](https://www.npmjs.org/package/punch):

```bash
$ npm test
$ npm start # this will start the server at http://localhost:9009
```

No httpd is required!

Once your changes look good, push to your fork and create a pull request.

# The site gets updated automatically

The GitHub repository is configured with a WebHook URL: http://punch-hook.beta.hackerspace.sg/

# Calendar API

<https://www.google.com/calendar/ical/mengwong%40hackerspace.sg/public/basic.ics>
