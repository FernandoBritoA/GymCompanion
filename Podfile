
platform :ios, '11.0'

target 'GymCompanion' do

  use_frameworks!

  # Pods for GymCompanion
  pod 'SwiftyGif'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end

end
