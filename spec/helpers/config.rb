require 'yaml'

def config
  config_file = File.dirname(File.expand_path(__FILE__)) + '/config.yml'
  YAML.safe_load(File.open(config_file))[ENV['SITE']]
end