Pod::Spec.new do |spec|

  spec.name         = "cryptoWannabeSDK"
  spec.version      = "0.1.0"
  spec.summary      = "A CocoaPods library written in Swift by Wannabe.Games"

  spec.description  = <<-DESC
This CocoaPods library helps you perform connection with Blockchain for iOS users
                   DESC

  spec.homepage     = "https://github.com/Wannabe-games/cryptoWannabeSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Michal2390" => "michal.fereniec0@gmail.com" }
  
  spec.ios.deployment_target = "14.0"
  spec.swift_version = "5.3"
  
  spec.source        = { :git => "https://github.com/Wannabe-games/cryptoWannabeSDK.git", :branch => 'Fetch_the_Cocoapod', :tag => "0.1.0" }
 spec.source_files  = "cryptoWannabeSDK/**/cryptoWannabeSDK.{h,m,swift}"

  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
        
end
 