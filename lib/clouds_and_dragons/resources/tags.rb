module CloudsAndDragons
  module Resources
    class Tags < Base
      def self.get_object(resource, options)
      end

      def parser
        stop_words = self.stop_words
        Trollop::Parser.new do
          opt :name, 'Name of the tag', :type => :string
          stop_on stop_words
        end
      end
    end
  end
end
