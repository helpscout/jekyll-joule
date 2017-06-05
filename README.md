# Joule 🔸 [![Build Status](https://travis-ci.org/helpscout/jekyll-joule.svg?branch=master)](https://travis-ci.org/helpscout/jekyll-joule) [![Gem Version](https://badge.fury.io/rb/jekyll-joule.svg)](https://badge.fury.io/rb/jekyll-joule) [![Coverage Status](https://coveralls.io/repos/github/helpscout/jekyll-joule/badge.svg?branch=master)](https://coveralls.io/github/helpscout/jekyll-joule?branch=master)

Joule is a Jekyll utility helper designed to make it (way) easier to write unit tests.

So far, Joule has only been tested with [minitest](https://github.com/seattlerb/minitest). However, you **should** be able to use it with other testing frameworks.


## Install

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-joule'
```

And then execute:
```
bundle
```

Or install it yourself as:
```
gem install jekyll-joule
```



## Basic Usage

Below is an example of how you can write a test with Joule.

```rb
class ExampleTest < JekyllUnitTest
  should "render a div containing the Page title" do
    @joule.render(%Q[
      ---
      title: "Yiss"
      ---
      <div class="aww">
        {{ page.title }}
      </div>
    ])

    el = @joule.find(".aww")

    assert(el)
    assert(el.text.include?("Yiss"))
    assert(el["class"].include?("aww"))
  end
end
```

Check out the full [rendering API documentation](./docs/rendering.md)



## Documentation

**[View the docs](https://github.com/helpscout/jekyll-joule/blob/master/docs/introduction.md)** to get started with Joule!



## Examples

**[View the example](https://github.com/helpscout/jekyll-joule/tree/master/examples)** Jekyll setup + Joule test files.
