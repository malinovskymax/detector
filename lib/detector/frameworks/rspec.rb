# RSpec framework class

require 'detector/frameworks/base/framework'
require 'detector/frameworks/base/testing_framework'

class Detector::Rspec < Detector::Framework

  extend Detector::TestingFramework

  def self.detected?
    detected = false

    if File.exist?('Gemfile.lock')
      detected = !!(File.open('Gemfile.lock').read =~ /rspec/)
    end

    if File.exist?('Gemfile') && !detected
      detected = !!(File.open('Gemfile').read =~ /gem\s+['"]rspec['\-"]/)
    end

    detected
  end

  def self.name
    'RSpec'
  end

  def self.version
    #TODO implement logic
    'Not implemented yet'
  end

  def self.run_tests_command
    'bundle exec rspec spec'
  end

end