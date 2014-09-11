require 'clouds_and_dragons/version'
require 'clouds_and_dragons/resources/base'
require 'clouds_and_dragons/actions/base'

require 'trollop'
require 'yaml'
require 'logger'
require 'right_api_objects'
require 'pry'

module CloudsAndDragons
  def self.start(args)

    resource_names = collect_resource_names(args)

    # Should post help immedicatly if no args given.
    if resource_names.empty?
      post_help
      exit
    end

    # Initialize the API connection
    # so @@client is available
    self.connect

    # main_command = list for example
    main_command = args.shift

    previous_resource = nil
    resource_names.each do |resource|
      parser = Resources[resource].parser
      parser.stop_on([]) if resource_names.last == resource
      options = parser.parse(args)

      previous_resource = Resources[resource].get_object(previous_resource, options)
    end

    Actions::Base[main_command].perform(previous_resource)
  end

  # Collects the resource names from ARGV.
  #
  def self.collect_resource_names(argv)
    argv.select { |arg| Resources.collections.include?(arg) }
  end

  def self.connect
    # This will be replaced by the "initial" connection to the api.
    options = YAML.load_file(File.expand_path("../../config/login.yml", __FILE__))
    options.merge!(timeout: nil)
    $client ||= RightApiObjects::Client.new(options)
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
