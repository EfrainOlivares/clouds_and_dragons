module CloudsAndDragons
  class Inputs < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the input', :type => :string
        stop_on %w{arrays cli deployments inputsnext inputs login servers snapshots tags volumes}
      end
    end
  end
end
