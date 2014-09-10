module CloudsAndDragons
  module Resources
    def self.[](implementation)
      @@implementations[implementation]
    end

    def self.register(subclass)
      @@implementations ||= {}
      @@implementations[subclass.name.split('::').last.downcase] = subclass
    end

    def self.collections
      @@implementations.keys
    end

    class Base
      def self.inherited(subclass)
        Resources.register(subclass)
      end

      def self.parser
        new.parser
      end

      def type
        self.class.name.split('::').last.downcase
      end

      def stop_words
        Resources.collections - [type]
      end
    end
  end
end

require 'clouds_and_dragons/resources/arrays'
require 'clouds_and_dragons/resources/deployments'
require 'clouds_and_dragons/resources/inputs'
require 'clouds_and_dragons/resources/inputsnext'
require 'clouds_and_dragons/resources/login'
require 'clouds_and_dragons/resources/servers'
require 'clouds_and_dragons/resources/snapshots'
require 'clouds_and_dragons/resources/tags'
require 'clouds_and_dragons/resources/volumes'

