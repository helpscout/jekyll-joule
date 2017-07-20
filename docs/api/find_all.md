# .find_all()

#### .find_all(selector)

| Argument | Type | Description |
| --- | --- | --- |
| selector | string | HTML selectors to find within your rendered Joule instance. |


#### Returns

| Type | Description |
| --- | --- |
| array | An array of [Nokogiri](https://github.com/sparklemotion/nokogiri) element instances. |


## Usage

```rb
html = %Q[
  <div class="pikachu">
    <div class="spark">One</div>
    <div class="spark">Two</div>
    <div class="spark">Three</div>
    <div class="spark">Fourteen</div>
  </div>
]

@joule.render(html)

els = @joule.find_all(".spark")
```

In the above example, the variable `els` would be an Array of 4 elements for:

```html
<div class="spark">...</div>
```

To check the properties of an individual element from your array, you'll need to select a single element.

Example:
```ruby
els = @joule.find_all(".spark")

el = els.first
# or
el = els.last
# or
el = els[0]
```
