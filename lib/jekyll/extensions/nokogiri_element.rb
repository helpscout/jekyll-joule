module Nokogiri
  module XML
    class Element
      def find_all *args
        self.css *args
      end

      def find *args
        self.css(*args).first
      end
    end
  end
end
