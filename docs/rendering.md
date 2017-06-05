# Rendering

Joule makes it super easy to write and render HTML for Jekyll.

This allows you to inline small chunks of HTML for your unit tests. This inline technique allows you to write many tests really quickly. It also makes it really clear what you are testing.



## API

Joule comes with a handful of methods to help you render and find HTML selectors for testing:

* [.render()](./api/render.md)
* [.find()](./api/find.md)
* [.find_all()](./api/find_all.md)



## Usage

In the following example, we're going to be rendering some HTML markup along with a couple of Jekyll `{% include %}` tags. For our test, we're checking to see if the `card/header/thunderbolt.html` include does what we expect it to do.

```rb
should "render include header markup" do
  html = %Q[
    <div class="pikachu">
      {% include card/header/thunderbolt.html %}
      <blockquote class="quote">Pika-pi</blockquote>
      {% include card/footer.html %}
    </div>
  ]
  @joule.render(html)
  el = @joule.find(".card-header")

  assert(el.text.include?("Header Yay!"))
  assert(el["class"].include?("thunderbolt"))
end
```
