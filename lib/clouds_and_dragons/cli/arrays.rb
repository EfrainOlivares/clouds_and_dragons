module CloudsAndDragons
  class Arrays < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the array', :type => :string
        stop_on %w{tags}
      end
    end
  end
end
