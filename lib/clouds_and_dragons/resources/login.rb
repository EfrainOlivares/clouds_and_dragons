module CloudsAndDragons
  module Resources
    class Login < Base
      def self.get_object(resource, options)
      end

      def parser
        stop_words = self.stop_words
        Trollop::Parser.new do
          opt :api_endpoint, 'API Endpoint', type => :string
          opt :id, 'ID of the account', type => :string
          opt :name, 'Name of the login', type => :string
          opt :password, 'Users password', type => :string
          opt :username, 'Users username', type => :string
          stop_on stop_words
        end
      end
    end
  end
end
