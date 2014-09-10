module CloudsAndDragons
  class Servers < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the server', :type => :string
        stop_on %w{arrays cli deployments inputsnext inputs login servers snapshots tags volumes}
      end
    end
  end
end
