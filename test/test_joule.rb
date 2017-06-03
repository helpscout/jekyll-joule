require "helper"

class JouleTest < JekyllUnitTest
  should "render a div with content (string)" do
    html = %Q[
      <div class="hello">
        Hello
      </div>
    ]
    @joule.render(html)
    el = @joule.css(".hello")[0]

    assert(el)
    assert(el.text.include?("Hello"))
    assert(el["class"].include?("hello"))
  end
end
