#
# Be sure to run `pod lib lint ReadMoreLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReadMoreLabel'
  s.version          = '1.0.0'
  s.summary          = 'Customization UILabel tail string.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Customization label tail string with text,color and font in restrict line.
                       DESC

  s.homepage         = 'https://github.com/FelixLinBH/ReadmoreLabel'
  s.screenshots     = 'https://github.com/FelixLinBH/ReadmoreLabel/blob/master/ScreenShot.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'felix.lin' => 'fly_81211@hotmail.com' }
  s.source           = { :git => 'https://github.com/FelixLinBH/ReadmoreLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
 
  s.ios.deployment_target = '8.0'

  s.source_files = 'ReadMoreLabel/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ReadMoreLabel' => ['ReadMoreLabel/Assets/*.png']
  # }

  s.public_header_files = 'ReadMoreLabel/Classes/**/*.h'
  s.frameworks = 'CoreText'
end
