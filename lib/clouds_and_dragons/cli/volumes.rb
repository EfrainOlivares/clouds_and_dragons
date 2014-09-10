module CloudsAndDragons
  class Volumes < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the volume', :type => :string
        stop_on %w{instances tags}
      end
    end
  end
end