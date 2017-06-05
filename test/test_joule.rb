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

  should "render non-block HTML tags" do
    html = %Q[
      <span class="hello">
        Hello
      </span>
      <span class="there">
        There
      </span>
    ]
    @joule.render(html)
    h = @joule.css(".hello")[0]
    t = @joule.css(".there")[0]

    assert(h.text.include?("Hello"))
    assert(t.text.include?("There"))
  end

  should "render markdown" do
    html = %Q[
      # Hi

      This is a paragraph.

      ## Second Wave

      Neat! There's a [link](#linky) maybe.
    ]
    @joule.render(html)

    assert(@joule.find("h1").text.include?("Hi"))
    assert(@joule.find_all("p").first.text.include?("This is a paragraph"))
    assert(@joule.find("h2").text.include?("Second Wave"))
    assert(@joule.find("a").text.include?("link"))
  end

  should "render markdown and HTML" do
    html = %Q[
      # Hi

      This is a paragraph.

      <div class="html">
        This is HTML
      </div>
    ]
    @joule.render(html)

    assert(@joule.find("h1").text.include?("Hi"))
    assert(@joule.find_all("p").first.text.include?("This is a paragraph"))
    assert(@joule.find(".html").text.include?("This is HTML"))
  end

  should "render markdown and HTML and Liquid" do
    html = %Q[
      # Hi

      {% assign liquid = "THIS IS LIQUID" %}
      {{ liquid | downcase }}

      <div class="html">
        This is HTML
      </div>
    ]
    @joule.render(html)

    assert(@joule.find("h1").text.include?("Hi"))
    assert(@joule.find("p").text.include?("this is liquid"))
    assert(@joule.find(".html").text.include?("This is HTML"))
  end

  class JouleDataTest < JekyllUnitTest
    should "return a Jekyll::Page instance" do
      html = %Q[
        <div class="hello">
          Hello
        </div>
      ]
      @joule.render(html)

      assert(@joule.data.instance_of?(Jekyll::Joule::Page))
    end

    should "parse front matter" do
      html = %Q[
        ---
        awesome: "yes"
        ---
        <div class="hello">
          <div class="awesome">
            {{ page.awesome }}
          </div>
          Hello
        </div>
      ]
      @joule.render(html)

      assert(@joule.find(".awesome").text.include?("yes"))
      assert(@joule.find(".hello").text.include?("yes"))
      assert(@joule.find(".hello").text.include?("Hello"))
    end
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
