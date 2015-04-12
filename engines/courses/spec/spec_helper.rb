require "./spec/base_config"

# Require factories
Dir[Rails.root.join("engines/courses/spec/factories/**/*.rb")].each { |f| require f }
