# Terminus bug

## Steps to reproduce:

```
bundle install
bundle exec terminus
```

Open a browser at http://localhost:7004/

```
$  irb -r ./app.rb
>> extend Capybara::DSL
>> visit '/'

```

View the browser console, there is an error

```
Uncaught SyntaxError: Unexpected end of input  javascript.js:4
```

View the `javascript.js` that has been served to the page, it is

```.js
// <a href="http://localhost:64432"></a>
(function() {
  console.log('It works!')
}).call(th
```

Note that the last line has been truncated. This has been modified from the source file which is:

```.js
// <a href="http://google.com"></a>
(function() {
  console.log('It works!')
}).call(this);
```
