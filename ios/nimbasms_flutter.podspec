#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint nimbasms_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'nimbasms_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin for interacting with the Nimba SMS API.'
  s.description      = <<-DESC
Flutter plugin for interacting with the Nimba SMS API..
                       DESC
  s.homepage         = 'https://nimbasms.com '
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Nimba SMS' => 'contact@nimbasms.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
