module CloudsAndDragons
  class Instances < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the instance', :type => :string
        stop_on %w{volumes tags}
      end
    end
  end
end
