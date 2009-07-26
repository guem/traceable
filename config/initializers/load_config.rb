#
# Return the configurations defined in ./config/config.yml
#
raw_config = File.read(RAILS_ROOT + "/config/config.yml")
#APP_CONFIG = YAML.load(raw_config)[RAILS_ENV]
APP_CONFIG = YAML.load(raw_config)[Socket.gethostname]
