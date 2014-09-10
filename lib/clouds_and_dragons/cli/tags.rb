module CloudsAndDragons
  class Tags < CLI
    def parse
      Trollop::options do
        opt :name, 'Name of the tag', :type => :string
        stop_on %w{tags}
      end
    end
  end
end
