module CloudsAndDragons
  class Servers < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the server', :type => :string
        stop_on %w{volumes tags}
      end
    end
  end
end
