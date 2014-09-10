module CloudsAndDragons
  class Instances < CLI
    def parse
      Trollop::options do
        opt :name, 'Name of the instance', :type => :string
        stop_on %w{tags}
      end
    end
  end
end
