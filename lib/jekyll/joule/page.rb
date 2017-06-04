require "jekyll"

module Jekyll
  module Joule
    class Page < Jekyll::Page
      WHITESPACE_REGEXP = %r!^\s*!m

      def unindent(content)
        content.gsub!(/\A^\s*\n/, "")
        if content =~ WHITESPACE_REGEXP
          indentation = Regexp.last_match(0).length
          content.gsub!(/^\ {#{indentation}}/, "")
        end

        return content
      end

      def reparse(content = "")
        content = unindent(content)
        if content =~ Jekyll::Document::YAML_FRONT_MATTER_REGEXP
          self.content = %Q[\n#{$POSTMATCH.strip}\n]
          self.data = SafeYAML.load(Regexp.last_match(1))
        else
          self.content = content
          self.data = Hash.new
        end

        return self.content
      end
    end
  end
end
