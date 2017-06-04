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

  class JouleFindTest < JekyllUnitTest
    should "get single node element" do
      html = %Q[
        <div class="hello">
          Hello
        </div>
      ]
      @joule.render(html)
      el = @joule.find(".hello")

      assert(el)
      assert(el["class"].include?("hello"))
      assert(el.text.include?("Hello"))
    end
  end

  class JouleFindAllTest < JekyllUnitTest
    should "get all node elements" do
      html = %Q[
        <div class="hello">
          Hello
        </div>
        <div class="hello">
          There
        </div>
      ]
      @joule.render(html)
      els = @joule.find_all(".hello")

      assert(els)
      assert_equal(els.length, 2)

      el = els[0]
      assert(el)
      assert(el["class"].include?("hello"))
      assert(el.text.include?("Hello"))
    end
  end
end
