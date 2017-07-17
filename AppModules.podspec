#
# Be sure to run `pod lib lint AppModules.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppModules'
  s.version          = '0.1.0'
  s.summary          = 'A super lightweight framework for building and integrating loadable modules'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AppModules addresses the problem of distributed development in environments where a common repository is impossible for legal
or practical reasons.  Developers can create, maintain, and test Modules which can be incorporated easily into other applications
by those other applications' developers.  The relationship between a Module and its application, or between Modules within
an application, is loosely modeled upon the REST pattern.  A Module is addressable by its containing application (or by other
modules) using HTTP verbs (currently GET is implemented).
                       DESC

  s.homepage         = 'https://github.com/mchaffee1/AppModules'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'mchaffee1' => 'mchaffee@thoughtworks.com' }
  s.source           = { :git => 'https://github.com/mchaffee1/AppModules.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AppModules/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AppModules' => ['AppModules/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
