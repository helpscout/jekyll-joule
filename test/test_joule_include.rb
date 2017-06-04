require "helper"

class JouleIncludeTest < JekyllUnitTest
  should "render an include html file" do
    html = %Q[
      <div class="hello">
        {% include test.html %}
        Hello
      </div>
    ]
    @joule.render(html)
    el = @joule.css(".test")[0]

    assert(el)
    assert(el["class"].include?("test"))
  end
end
