Pod::Spec.new do |s|
  s.name         = "NRBlurryStepOutAnimatedTransitioning"
  s.version      = "0.1.0"
  s.summary      = "tweetbot like blurry modal view transitioning"
  s.homepage     = "https://odoruinu.net/"
  s.license      = 'MIT'
  s.author       = { "Takuya Matsuyama" => "nora@odoruinu.net" }
  s.source       = { :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.platform     = :ios, '7.0'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end
