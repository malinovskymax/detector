require 'detector'

detected = Detector.detect

if detected
  p detected[:language].name
  p detected[:language].version
  p detected[:frameworks]
end