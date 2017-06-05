module Oga
  module XML
    class Element
      def find_all *args
        self.css *args
      end

      def find *args
        self.css(*args).first
      end

      def prop *args
        self.get *args
      end
    end
  end
end
