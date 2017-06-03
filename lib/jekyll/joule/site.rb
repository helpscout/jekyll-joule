require "jekyll"
require "nokogiri"

module Jekyll
  module Joule
    class Site
      attr_accessor :data, :html, :site

      def initialize(site)
        @site = site
        @site.data["joule_data"]
        @html = ""
        @fixture_id = "joule-fixture"
      end

      def generate(page)
        @data = [page]
        @site.render

        return page
      end

      def render(content)
        page = @site.pages.last
        page.content = %Q[<div id="#{@fixture_id}">#{content}</div>]
        generate(page)
        @html = Nokogiri::HTML(@data.first["content"]).css(%Q[##{@fixture_id}])[0]

        return self
      end

      def css(selectors)
        find_all(selectors)
      end

      def find_all(selectors)
        @html.css(selectors)
      end

      def find(selector)
        find_all(selector)[0]
      end
    end
  end
end
