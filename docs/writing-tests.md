# Writing Tests

Now that we've [set up](./setup.md) our Jekyll project for testing, let's add our first test file.

> ## TL;DR
> You can find an example test in our [examples](https://github.com/helpscout/jekyll-joule/tree/master/examples/test).

## Add your test file

In your `test/` directory, add a new `.rb` with a name that describes what you're testing. Don't forget to start the file name with `test_`!

```shell
my-jekyll/
├── ...
├── test/
│   ├── helper.rb
│   └── test_yiss.rb
├── Gemfile
└── Rakefile
```


## Write your test

Copy/paste the following into your new `test_yiss.rb` file. Feel free to remove all of the Ruby comments!

```ruby
# Remember our helper.rb setup file? We'll be needing that.
require "helper"

# Name the class of your test whatever it is you'd like!
# Ideally, you'd want something that describes what you're testing.
class AwwYissTest < JekyllUnitTest
  # should describes what it is you're testing
  should "render a div" do
    # 1. Write your markup
    html = %Q[
      <div class="aww">
        Yiss
      </div>
    ]

    # 2. Pass it into Joule for rendering
    @joule.render(html)

    # 3. Find your HTML element(s)
    el = @joule.find(".aww")

    # 4. Write tests
    assert(el)
    assert(el.text.include?("Yiss"))
    assert(el["class"].include?("aww"))
  end
end
```

For this super simple test, all we're doing is checking if the HTML provided within the `%Q[]` tag has the text and class we expect it to have when rendered.


## Run your test

To actually run your test, run the following command (you're probably going to be doing this a lot):

`bundle exec rake test`

If all goes well, you should see something like this in your Terminal:

```
Finished in 0.05835s
1 tests, 3 assertions, 0 failures, 0 errors, 0 skips
```

And that's it! You've written your first Jekyll unit test with Minitest and Joule! 🚀


![Aww yiss](https://media.giphy.com/media/S4P8Z5fiLRpOU/giphy.gif)<br>
_Aww yiss!_


Joule supports Jekyll plugins, `{% include %}`, Liquid filters, and all the fun things you'd expect from your Jekyll code.

Good luck and have fun testing! ✌️😎


## Wanna learn more?

To learn more about how you can use Joule, check out our **[rendering docs](./rendering.md)**.
