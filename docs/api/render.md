# .render()

#### .render(content)

| Argument | Type | Description |
| --- | --- | --- |
| content | string | The HTML to be parsed and rendered by Jekyll. |


#### Returns

| Type | Description |
| --- | --- |
| instance | Joule Site instance. |



## Usage

The easiest way to pass an HTML string into `@Joule` is to use Ruby's [`%Q string interpolator](https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals).

Joule's render method accepts anything you'd expect Jekyll to be able to render. That includes HTML and Liquid tags, blocks, and filters (like `{% include %}`).

```rb
html = %Q[
  <div class="pikachu">
    {% include card/header/thunderbolt.html %}
    <blockquote>Pika-pi</blockquote>
    {% include card/footer.html %}
  </div>
]

@joule.render(html)
```


### Markdown

Joule's `,render()` method accepts markdown as well!

```rb
markdown = %Q[
  # Pikachu
  {% include card/header/thunderbolt.html %}

  > Pika-pi

  {% include card/footer.html %}
]

@joule.render(markdown)
```
