module CloudsAndDragons
  class Snapshots < CLI
    def parser
      Trollop::Parser.new do
        opt :name, 'Name of the snapshot', :type => :string
        stop_on %w{tags}
      end
    end
  end
end
