# .prop()

#### .prop(property)

| Argument | Type | Description |
| --- | --- | --- |
| property | string | Property of the HTML selector to retrieve |

#### Aliases

**[.get()](http://code.yorickpeterse.com/oga/latest/Oga/XML/Element.html#get-instance_method)**


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
