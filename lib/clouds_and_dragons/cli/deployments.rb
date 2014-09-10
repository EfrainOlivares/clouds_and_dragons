module CloudsAndDragons
  class Deployments < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the deployment', :type => :string
        stop_on %w{volumes servers tags}
      end
    end
  end
end
