require 'clouds_and_dragons/version'
require 'clouds_and_dragons/cli/cli'
require 'clouds_and_dragons/resources/base'
require 'clouds_and_dragons/actions/base'

require 'trollop'
require 'yaml'
require 'logger'
require 'right_api_objects'

module CloudsAndDragons
  def self.start(args)

    # Initialize the API connection
    # so @@client is available
    self.connect
    sub_cmds = collect_sub_commands(args)

    if sub_cmds.empty?
      post_help
      exit
    end

    # main_command = list for example
    main_command = sub_cmds.shift

    previous_resource = 'something'
    sub_cmds.each do |sub_cmd|
      parser = CLI[sub_cmd].parser
      parser.stop_on(nil) if sub_cmds.last == sub_cmd
      options = parser.parse

      #TODO: Uncomment this to proceed
      #previous_resource = Resources::Base[sub_cmd].get_object(previous_resource, options)
    end

    #TODO: Uncomment this to proceed
    #Actions::Base[main_command].perform(previous_resource)
  end

  def self.collect_sub_commands(argv)
    argv.reject { |arg| arg =~ /^-/ }
  end
  
  def self.connect
    # This will be replaced by the "initial" connection to the api.
    options = YAML.load_file(File.expand_path("../../config/login.yml", __FILE__))
    options.merge!(:logger => Logger.new(STDERR))
    @@client ||= RightApiObjects::Client.new(options)
  end

  def self.post_help
    help_banner = "clouds_and_dragons  Usage:  cnd <commmand> <resource> <filter-flag>\n" +
                  "\n" +
                  "Available commands:\n" +
                  "list       # list resources\n" +
                  "           # example: bundle exec cnd list deployments --name='test_deployment\n"
    puts help_banner
  end
end
