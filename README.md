##Cuke-test##

A [LoopBack](http://loopback.io) project which provides a local web end point for API testing using Ruby and cucumber.

The API test software can be found under the **spec** folder.

This project was developed on Centos7. I doubt very much that it will work in Microsoft Windows.

###Starting LoopBack###

LoopBack is a free part of StrongLoop.  You can go to their website to learn more about LoopBack.  LoopBack provides a local web server target. You can customize which HTTP requests LoopBack accepts and what responses to send back.  This first version is using very simple requests/responses.  It is anticipated that more complex scenarios will be created in the future.

<ol>
<li>Open a bash terminal
<li>cd <i>to your cuke-test folder.  This is the project root folder.</i>
<li>Type <b>slc run</b> and press enter
<li>The bash terminal is now your console.log
<li>Open a browser (I use Firefox) and enter URL <b>http://0.0.0.0:3000/explorer</b>
<li>Currently, <b>Veggies</b> is supported so select it
<li>Observe that various HTTP requests are supported. Use <b>Try It</b> buttons to see how requests and responses are formed.
</ol>

###The cucumber tests###

The cucumber tests are located in the **spec** folder.  Cucumber is designed to support Business Driven Development.

Cucumber is a ruby gem. You will need to install Ruby 2.2.0.

After dowloading cuke-test:
<ol>
<li>Open a bash terminal
<li>Type <b>gem list bundler</b>
<li>If bundler is not found, type <b>gem install bundler</b> and press enter
<li>cd <i>to the cuke-test project root folder</i>
<li>cd spec
<li>Type <b>bundle install</b> and press enter
<li>This will install the gems needed by this project
</ol>

Cucumber tests consist of:

<ul>
<li><b>Feature</b> files, each describes the tests for a User Story.
<li>A Feature contains one or more <b>Scenarios</b>
<li>Each Scenario contains a list of <b>Given</b>, <b>When</b> and <b>Then</b> statements that describe from a business perspective the desired application behavior
<li><b>Step definition</b> files are Ruby files which contain the code implementations for the Given, When, and Then statements.
<li>There are support files under the <b>support</b> folder
</ul>

To lauch the cucumber tests
<ol>
<li>Make sure that the LoopBack <b>cuke-test</b> application is running in a bash terminal window (see above)
<li>Open a second bash terminal
<li> cd cuke-test/spec
<li>Type <b>cucumber</b> and press enter
</ol>

###HTTParty###

Httparty is a Ruby gem that allows you to create and send HTTP requests to a URL and receive responses.  Rspec/expectations are used to make assertions about expected behavior.

No browser is utilized by these tests which makes their execution very swift. The tests target the local LoopBack URL.  LoopBack can be made to mock any real API.  And of course real API's can be the target of such tests.  LoopBack is simply convenient.
