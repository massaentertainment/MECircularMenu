Pod::Spec.new do |s|
  s.name         = "MECircularMenu"
  s.version      = "1.0.0"
  s.summary      = "A circular menu to UIKit-based applications."

  s.description  = "The MECircularMenu is a UIKit framework highly customizable and very adaptative."

  s.homepage     = "https://github.com/massaentertainment"
  s.screenshots  = "https://raw.githubusercontent.com/massaeentertainment/MECircularMenu/master/Screenshots/circm.gif"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = "MassaEntertainment"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/massaentertainment/MECircularMenu.git", :tag => "#{s.version}" }

  s.source_files  = "MECircularMenu", "GVCircularMenu/*.{h,m,swift}"
end
