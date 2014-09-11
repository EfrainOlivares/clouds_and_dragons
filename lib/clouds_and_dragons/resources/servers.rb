module CloudsAndDragons
  module Resources
    class Servers < Base
      def self.get_object(resources, options)
        servers = []
        resources.each do |resource|
          if options[:name]
            servers += resource.servers(name: options[:name])
          else
            servers += resource.servers
          end
        end
        servers
      end

      def parser
        stop_words = self.stop_words
        Trollop::Parser.new do
          opt :name, 'Name of the server', :type => :string
          stop_on stop_words
        end
      end
    end
  end
end
