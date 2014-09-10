module CloudsAndDragons
  module Actions
    class List < Base
      def self.perform(resources)
         resources.each do |item|
           puts item.name
           puts item.href
         end
      end
    end
  end
end
