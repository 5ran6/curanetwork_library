#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint curanetwork_library.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'curanetwork_library'
  s.version          = '0.0.1'
  s.summary          = 'A library for the frontend and backend of the curanetwork mobile apps.'
  s.description      = <<-DESC
A library for the frontend and backend of the curanetwork mobile apps.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
