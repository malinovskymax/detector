# Cucumber framework class

require 'detector/frameworks/framework'
require 'detector/frameworks/testing_framework'

class Detector::Cucumber < Detector::Framework

  extend Detector::TestingFramework

  def self.detected?
    detected = false

    if File.exist?('Gemfile.lock')
      detected = !!(File.open('Gemfile.lock').read =~ /cucumber/)
    end

    if File.exist?('Gemfile') && !detected
      detected = !!(File.open('Gemfile').read =~ /gem\s+['"]cucumber['\-"]/)
    end

    detected
  end

  def self.name
    'Cucumber'
  end

  def self.version
    #TODO implement logic
    'Not defined yet'
  end

  def self.run_tests_command
    'bundle exec cucumber features'
  end

end