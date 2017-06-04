require "helper"

class JouleTemplateTest < JekyllUnitTest
  should "render a template (custom Jekyll plugin)" do
    html = %Q[
      <div class="best-hats">
        Best
        {% template awesome.html %}
          ---
          title: "New Title"
          ---
          Hats!
        {% endtemplate %}
      </div>
    ]
    @joule.render(html)
    el = @joule.find(".awesome")
    h1 = el.find("h1")
    content = el.find(".content")

    assert(el)
    assert(h1)
    assert(content)
    assert(h1.text.include?("New Title"))
    assert(content.text.include?("Hats"))
  end
end
