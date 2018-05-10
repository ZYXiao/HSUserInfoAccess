Pod::Spec.new do |s|
  s.name         = "HSUserInfoAccess"

  s.version      = "0.0.1"

  s.summary      = "user infomation access utils."

  s.homepage     = "https://github.com/ZYXiao/HSUserInfoAccess"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "ZYXiao" => "304983615@qq.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ZYXiao/HSUserInfoAccess.git", :tag => "0.0.1" }

  s.source_files  = "HSUserInfoAccess/*.{h,m}"

  s.frameworks    = 'Foundation', 'UIKit'

  s.requires_arc = true
end
