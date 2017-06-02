require "helper"
require "mrpoole"

class Poole < JekyllUnitTest
  should "Render a div with content (string)" do
    @poole.render("<div class=\"hello\">Hello</div>")
    el = @poole.css(".hello")

    assert(el)
    assert_equal(el.text, "Hello")
  end
end
