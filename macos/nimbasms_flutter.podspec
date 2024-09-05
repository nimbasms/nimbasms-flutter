#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint nimbasms_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'nimbasms_flutter'
  s.version          = '1.0.0'
  s.summary          = 'Flutter plugin for interacting with the Nimba SMS API.'
  s.description      = <<-DESC
Flutter plugin for interacting with the Nimba SMS API.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Nimba SMS' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
