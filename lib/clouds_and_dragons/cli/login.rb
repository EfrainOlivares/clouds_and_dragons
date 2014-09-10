module CloudsAndDragons
  class Login < CLI
    def parser
      Trollop::Parser.new do
        opt :api_endpoint, 'API Endpoint', type => :string
        opt :id, 'ID of the account', type => :string
        opt :name, 'Name of the login', type => :string
        opt :password, 'Users password', type => :string
        opt :username, 'Users username', type => :string
        stop_on %w{arrays cli deployments inputsnext inputs login servers snapshots tags volumes}
      end
    end
  end
end
