module CloudsAndDragons
  module Actions
    class Base
      def self.[](implementation)
        @@implementations[implementation]
      end

      def self.inherited(subclass)
        @@implementations ||= {}
        @@implementations[subclass.name.split('::').last.downcase] = subclass
      end
    end
  end
end

require 'clouds_and_dragons/actions/list'
