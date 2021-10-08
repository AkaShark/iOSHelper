#
# Be sure to run `pod lib lint iOSerHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iOSerHelper'
  s.version          = '0.1.0'
  s.summary          = 'iOS 调试工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS 调试工具
  1. Mock数据调试网络数据
                       DESC

  s.homepage         = 'https://github.com/1548742234@qq.com/iOSerHelper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1548742234@qq.com' => '1548742234@qq.com' }
  s.source           = { :git => 'https://github.com/1548742234@qq.com/iOSerHelper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.13'
  # 后期拆分清楚
  s.source_files = 'iOSerHelper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iOSerHelper' => ['iOSerHelper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
