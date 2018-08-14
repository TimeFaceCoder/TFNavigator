Pod::Spec.new do |s|
  s.name         = "TFNavigator"
  s.version      = "0.0.2"
  s.summary      = "时光流影iOS Navigator框架"
  s.homepage     = "https://github.com/TimeFaceCoder/TFNavigator"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Melvin" => "yangmin@timeface.cn" }
  s.social_media_url   = "http://www.timeface.cn"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/TimeFaceCoder/TFNavigator.git"}
  s.source_files  = "TFNavigator/TFNavigator/**/*.{h,m,c}"
  s.requires_arc = true
end
