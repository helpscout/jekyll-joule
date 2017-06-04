require "helper"

class JouleNokogiriExtTest < JekyllUnitTest
  should "extend Nokigiri's Element class with find method" do
    html = %Q[
      <div class="hello">
        <h1>Yes</h1>
        <h2>No</h2>
        <h2>Maybe?</h2>
        Hello
      </div>
    ]
    @joule.render(html)
    el = @joule.find(".hello")
    h1 = el.find("h1")
    h2 = el.find("h2")

    assert(h1.text.include?("Yes"))
    assert(h2.text.include?("No"))
  end

  should "extend Nokigiri's Element class with find_all method" do
    html = %Q[
      <div class="hello">
        <h2>Yes</h2>
        <h2>No</h2>
        <h2>Maybe?</h2>
        Hello
      </div>
    ]
    @joule.render(html)
    el = @joule.find(".hello")
    h1 = el.find_all("h1")
    h2 = el.find_all("h2")

    assert_equal(h2.length, 3)
    assert(h2.first.text.include?("Yes"))
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
