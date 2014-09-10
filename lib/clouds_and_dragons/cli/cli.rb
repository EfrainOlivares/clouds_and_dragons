module CloudsAndDragons
  class CLI
    def self.[](implementation)
      @@implementations[implementation]
    end

    def self.inherited(subclass)
      @@implementations ||= {}
      @@implementations[subclass.name.split('::').last.downcase] = subclass
    end

    def self.parse
      new.parse
    end

    def parse
      Trollop::options do
        stop_on %w{login list create destroy}
      end
    end
  end
end

require 'clouds_and_dragons/cli/deployments'
require 'clouds_and_dragons/cli/instances'
require 'clouds_and_dragons/cli/tags'
