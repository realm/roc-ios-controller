#
# Be sure to run `pod lib lint ROCController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ROCController'
  s.version          = '0.1.0'
  s.summary          = 'Realm Object Chat Controller. A powerful Chatto controller backed by Realm!'

  s.description      = <<-DESC
Creating a chat app is insanely hard. Not only the UI but also the data layer. With Realm's fast database and change notification API, we can show blazing fast, 60fps chats that you can easily integrate into your own app.
                       DESC

  s.homepage         = 'https://github.com/realm/roc-ios-controller'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mbalex99' => 'mbalex99@gmail.com' }
  s.source           = { :git => 'https://github.com/mbalex99/ROCController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/maxofeden'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ROCController/Classes/**/*'
  s.resource_bundles = {
    'ROCController' => ['ROCController/Assets/Images.xcassets']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'RealmSwift', '~> 2.4.4'
  s.dependency 'Chatto', '~> 3.0.1'
  s.dependency 'ChattoAdditions', '~> 3.0.1'
end
