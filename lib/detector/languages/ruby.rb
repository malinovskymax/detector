# Ruby language class

require 'detector/languages/base/language'

# frameworks for Ruby
require 'detector/frameworks/rspec'
require 'detector/frameworks/cucumber'

class Detector::Ruby < Detector::Language

  def self.frameworks
    [Detector::Rspec, Detector::Cucumber]
  end

  def self.detected?
    File.exist?('Gemfile') || File.exist?('Gemfile.lock') || File.exist?('.ruby-version')
  end

  def self.name
    'Ruby'
  end

  # Gemfile.lock
  # Gemfile
  # .ruby-version
  def self.version
    version = nil
    version_detected = nil

    if File.exist?('Gemfile.lock')
      version_detected = File.open('Gemfile.lock').read.match(/^\s{3}ruby\s\d\.\d[\\.\d]*/)
      version = $&.gsub(/^\s{3}ruby\s/, '') if version_detected
    end

    if File.exist?('Gemfile') && !version_detected
      version_detected = File.open('Gemfile').read.match(/^ruby\s['|"]\d\.\d[\\.\d]*['|"]/)
      version = $&.match(/\d\.\d[\\.\d]*/)[0] if version_detected
    end

    if File.exist?('.ruby-version') && !version_detected
      version_detected = File.open('.ruby-version').read.match(/\d\.\d[\\.\d]*/)
      version = $& if version_detected
    end

    version
  end

end
