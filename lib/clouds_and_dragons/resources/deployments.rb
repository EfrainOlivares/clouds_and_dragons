module CloudsAndDragons
  module Resources
    class Deployments < Base
      def self.get_object(resource, options)
      end

      def parser
        stop_words = self.stop_words
        Trollop::Parser.new do
          opt :name, 'Name of the deployment', :type => :string
          stop_on stop_words
        end
      end
    end
  end
end
