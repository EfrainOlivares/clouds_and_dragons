require 'clouds_and_dragons/version'
require 'thor'

module CloudsAndDragons
  class Runner < Thor
    desc 'moo', 'Make a cow noise'
    def moo
      puts 'MOOOOOO'
    end
  end
end
