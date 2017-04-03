require 'detector/version'

# languages
require 'detector/languages/ruby'

# frameworks
# require 'detector/frameworks/rspec'
# require 'detector/frameworks/cucumber'

module Detector
  LANGUAGES = [Detector::Ruby]

  def self.detect
    language = self.detect_language

    return false unless language

    frameworks = self.detect_frameworks(language)

    { language: language, frameworks: frameworks }
  end

  def self.detect_language
    language = nil

    LANGUAGES.each do |lang|
      if lang.detected?
        language = lang
        break
      end
    end

    language
  end

  def self.detect_frameworks(language)
    return false unless language

    frameworks = []

    language.frameworks.each do |framework|
      frameworks << framework if framework.detected?
    end

    frameworks
  end

end
