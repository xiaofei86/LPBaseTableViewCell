
Pod::Spec.new do |s|

  s.name         = "LPBaseTableViewCell"
  s.version      = "1.0.1"
  s.summary      = “base tableviewcell"
  s.homepage     = "https://github.com/xiaofei86/LPBaseTableViewCell"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "XuYafei" => "xuyafei86@163.com" }
  s.social_media_url   = "http://xuyafei.cn"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/xiaofei86/LPBaseTableViewCell.git", :tag => s.version }
  s.source_files  = "LPBaseTableViewCell/*.{h,m}"
  s.requires_arc = true

end
