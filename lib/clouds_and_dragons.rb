require 'clouds_and_dragons/version'
require 'clouds_and_dragons/cli/cli'
require 'clouds_and_dragons/resources/base'
require 'clouds_and_dragons/actions/base'

require 'trollop'

module CloudsAndDragons
  def self.start(args)
    sub_cmds = collect_sub_commands(args)
    # main_command = list for example
    main_command = sub_cmds.shift

    previous_resource = 'something'
    sub_cmds.each do |sub_cmd|
      options = CLI[sub_cmd].parse
      previous_resource = Resouces[sub_cmd].get_object(previous_resource, options)
    end

    Actions[main_command].perform(previous_resource)
  end

  def self.collect_sub_commands(argv)
    argv.reject { |arg| arg =~ /^-/ }
  end
end
