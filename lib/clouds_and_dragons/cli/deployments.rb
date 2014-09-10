module CloudsAndDragons
  class Deployments < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the deployment', :type => :string
        stop_on %w{arrays cli deployments inputsnext inputs login servers snapshots tags volumes}
      end
    end
  end
end
