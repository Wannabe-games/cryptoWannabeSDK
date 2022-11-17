Pod::Spec.new do |spec|

  spec.name         = "cryptoWannabeSDK"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift by Wannabe.Games"

  spec.description  = <<-DESC
This CocoaPods library helps you perform connection with Blockchain for iOS users
                   DESC

  spec.homepage     = "https://github.com/Wannabe-games/cryptoWannabeSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Michal2390" => "michal.fereniec0@gmail.com" }
  
  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"
  
  spec.source        = { :git => "https://github.com/Wannabe-games/cryptoWannabeSDK.git", :tag => "0.0.1" }
 spec.source_files  = "cryptoWannabeSDK/**/cryptoWannabeSDK.{h,m,swift}"
        
end
