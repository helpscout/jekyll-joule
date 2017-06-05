# Setup

The are a couple of things you need to do to get started with writing Jekyll tests.

The following steps are based on Jekyll's own [test setup](https://github.com/jekyll/jekyll/tree/master/test). However, they've been simplified to make it easier to follow 😘.

> ## TL;DR
> You can find all of the setup code in our [examples](https://github.com/helpscout/jekyll-joule/tree/master/examples).

## Add test dependencies

Add a `Gemfile` to your Jekyll project's root directory, if you don't already have one.

```shell
my-jekyll/
├── ...
└── Gemfile
```

In that Gemfile, add the following Gem dependencies (if you don't have them already):

```ruby
source 'https://rubygems.org'
group :test do
  gem "minitest", "~> 5.8"
  gem "minitest-profile"
  gem "minitest-reporters"
  gem "rake", "~> 10.0"
  gem "rspec-mocks"
  gem "shoulda"
  gem "jekyll-joule"
end
```

This allow [Bundler](http://bundler.io/) to install and use these various Gems to power your Jekyll tests.


## Add a Rakefile

We're going to be using the following command to run our tests:

`bundle exec rake test` 

In order to get this working, we need to create a `Rakefile` and add a `test` task.

Create an add a `Rakefile` (no extensions) to your Jekyll project's root directory.

```shell
my-jekyll/
├── ...
├── Gemfile
└── Rakefile
```

In that `Rakefile`, add the following:

```ruby
require 'rake'
require 'rake/testtask'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), *%w[lib]))

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end
```

This tells `Rake` that for our `test` task, execute any `.rb` file in our `test/` directory that has a file name starting with `test_`.


## Add a test directory

In your Jekyll project's root folder, add a new `test/` directory

```shell
my-jekyll/
├── ...
├── test/
├── Gemfile
└── Rakefile
```

This is where you'll be adding all of your tests 😎.


## Add a test helper file

(Almost there, I promise). In your `test/` directory, add a new file called `helper.rb`:

```shell
my-jekyll/
├── ...
├── test/
│   └── helper.rb
├── Gemfile
└── Rakefile
```

There's a **bunch** of stuff you need to add to your `helper.rb`. The easiest thing you can do is copy everything from our [example `helper.rb` file](https://github.com/helpscout/jekyll-joule/blob/master/examples/test/helper.rb), and paste it into your `helper.rb` file ✌️.

That's it! Your Jekyll site is setup for testing 🎉

To confirm, run the following command:

`bundle exec rake test`

As long as you don't see a bunch of errors in your Terminal (😱), then you're good!

Next, let's start **[writing some tests](./writing-tests.md)**!
