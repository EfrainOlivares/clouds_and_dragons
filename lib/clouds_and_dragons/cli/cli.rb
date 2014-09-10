module CloudsAndDragons
  class CLI
    def self.[](implementation)
      @@implementations[implementation]
    end

    def self.inherited(subclass)
      @@implementations ||= {}
      @@implementations[subclass.name.split('::').last.downcase] = subclass
    end

    def self.parser
      new.parser
    end

    def parser
    end
  end
end

require 'clouds_and_dragons/cli/arrays'
require 'clouds_and_dragons/cli/deployments'
require 'clouds_and_dragons/cli/inputs'
require 'clouds_and_dragons/cli/inputsnext'
require 'clouds_and_dragons/cli/servers'
require 'clouds_and_dragons/cli/snapshots'
require 'clouds_and_dragons/cli/tags'
require 'clouds_and_dragons/cli/volumes'
