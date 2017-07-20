# .prop()

#### .prop(property)

| Argument | Type | Description |
| --- | --- | --- |
| property | string | Property of the HTML selector to retrieve |

#### Aliases

**[.attr()](http://www.rubydoc.info/github/sparklemotion/nokogiri/Nokogiri/XML/Attr)**


#### Returns

| Type | Description |
| --- | --- |
| string | Value of the property retrieved |


## Usage

In the following example, we're using `.prop()` to check the `class` property of the `<div>`:

```rb
should "contain class of pika" do
  html = %Q[
    <div class="pikachu pika">
      ...
    </div>
  ]
  @joule.render(html)

  el = @joule.find(".pikachu")

  assert(el.prop("class").include?("pika"))
end
```
