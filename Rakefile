# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

begin
  require 'rspec/core/rake_task'

  # Run specs inside the engines as well as specs in the Rails root.
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = "engines/**/spec/**/*_spec.rb, spec/**/*_spec.rb"
  end
rescue LoadError
end

Rails.application.load_tasks

task default: :spec
