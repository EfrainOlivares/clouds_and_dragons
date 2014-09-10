module CloudsAndDragons
  class Deployments < CLI
    def parse
      Trollop::options do
        opt :name, 'Name of the deployment', :type => :string
        stop_on %w{instances tags}
      end
    end
  end
end
