AngularJS Tutorial / Presentation
=========

This project is intended to give you an overview of the AngularJS framework. It is composed of four modules:

  - presentation/
    - [reveal.js] presentation
  - server/
    - simple [Express]-based [NodeJS] REST server
  - client/
    - built on top of the [mimosa] development toolkit
    - uses [requirejs] and [bower] for dependency management
    - integrated with the [karma] test runner
    - real-time code coverage reports from [istanbul]
    - assertions courtesy of [chai]
    - test harness built on [mocha]
  - AngularJS - Superheroic JavaScript MVW Framework.pdf
    - a PDF generated from the presentation - this may have some rendering issues due to the interative nature of the presentation    

Abstract
----

Web development has come a long way from GeoCities and blink tags! Today it is possible to build rich internet applications that replicate much of the functionality found in traditional desktop software. Unfortunately integrating and testing the CSS, Javascript, and HTML necessary to deliver this experience can be a long and challenging. In this talk we’ll explore AngularJS, a new framework maintained by Google that marries Javascript and HTML into one easy to use package. The first half of the talk will compare AngularJS to other competing frameworks and present some of its high level concepts. The second half of the presentation will be an interactive lab where we will build a full application, complete with unit tests and code coverage reports.



Installation
--------------
The installation is broken into three pieces, depending on what you would like to use:
##### Presentation
```sh
git clone [git-repo-url] angularpresentation
cd angularpresentation/presentation
npm install
npm install -g grunt-cli
grunt serve
#YOU SHOULD NOW BE ABLE TO ACCESS THE PRESENTATION AT HTTP://LOCALHOST:8000
```
##### Client
```sh
git clone [git-repo-url] angularpresentation
cd angularpresentation/client
npm install -g mimosa@1.3.9
mimosa watch -s
#YOU SHOULD NOW BE ABLE TO ACCESS THE CLIENT AT HTTP://LOCALHOST:3000
```
##### Server
```sh
git clone [git-repo-url] angularpresentation
cd angularpresentation/server
npm install
node rest_api.js
#THERE IS NO FRONTEND, HOWEVER THE SERVER WILL ANSWER AT  HTTP://LOCALHOST:8080
```

License
----

Apache 2.0

[reveal.js]:http://lab.hakim.se/reveal-js/#/
[mimosa]:http://mimosa.io/
[requirejs]:http://requirejs.org/
[bower]:http://bower.io/
[karma]:http://karma-runner.github.io/
[NodeJS]:http://nodejs.org
[Express]:http://expressjs.com/
[istanbul]:http://gotwarlost.github.io/istanbul/
[chai]:http://chaijs.com/
[mocha]:http://visionmedia.github.io/mocha/
[express]:http://expressjs.com

