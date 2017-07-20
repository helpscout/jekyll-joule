# .find()

#### .find(selector)

| Argument | Type | Description |
| --- | --- | --- |
| selector | string | HTML selectors to find within your rendered Joule instance. |


#### Returns

| Type | Description |
| --- | --- |
| instance | A [Nokogiri](https://github.com/sparklemotion/nokogiri) element instance. |


## Usage

```rb
html = %Q[
  <div class="pikachu">
    {% include card/header/thunderbolt.html %}
    <blockquote class="quote">Pika-pi</blockquote>
    {% include card/footer.html %}
  </div>
]

@joule.render(html)

el = @joule.find("blockquote")
```

In the above example, the variable `el` would be an element for:

```html
<blockquote class="quote">Pika-pi</blockquote>
```

That means that you'll be able to check the properties of this element by using methods like:

```ruby
el.text       # Pika-pi
el["class"]   # quote
```

### Chaining

Joule has enhanced Nokogiri's `XML::Element` class by allowing you to find elements within elements.

In the example below, we're able to find the inner `.pika` selector within the outer `.pikachu` selector.
```rb
html = %Q[
  <div class="pikachu">
    <div class="pika">
      <blockquote class="quote">
        Pika-pi
      </blockquote>
    </div>
  </div>
]

@joule.render(html)

outer = @joule.find(".pikachu")
inner = outer.find(".pika")
```
