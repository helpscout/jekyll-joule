require "jekyll"
require "jekyll/joule/page"
require "nokogiri"

module Jekyll
  module Joule
    class Site
      attr_accessor :data, :html, :site

      def initialize(site)
        @site = site
        @data = false
        @html = ""
        @fixture_id = "joule-fixture"
        @test_page_name = "test_joule.md"

        return self
      end

      def get_page
        @site.pages.find {|p| p.name === @test_page_name}
      end

      def reset_page
        @site.pages.delete_if {|p| p.name === @test_page_name}
      end

      def generate(page)
        reset_page
        @site.pages.push(page)
        @site.render

        return get_page
      end

      def render(content)
        page = Jekyll::Joule::Page.new(@site, @site.source, "/", @test_page_name)
        page.reparse(content)
        page.content = %Q[<div id="#{@fixture_id}">#{page.content}</div>]
        @data = generate(page)
        @html = Nokogiri::HTML(@data["content"]).css(%Q[##{@fixture_id}])[0]

        return self
      end

      def css(selectors)
        find_all(selectors)
      end

      def find_all(selectors)
        @html.css(selectors)
      end

      def find(selector)
        find_all(selector).first
      end
    end
  end
end
