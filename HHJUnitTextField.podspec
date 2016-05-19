Pod::Spec.new do |s|
  s.name     = 'HHJUnitTextField'
  s.version  = '0.0.2'
  s.license  = 'MIT'
  s.author   = {'szulmj' => 'https://github.com/szhonghaijiang' }
  s.homepage = 'https://github.com/szhonghaijiang/HHJUnitTextField'
  s.summary  = 'A swift textfield with unit.'
  s.description = 'A swift textfield with units. You can set the pre unit and the sub unit and keep the really UITextField which can be Interaction. The units can not be change.'

  s.source   = { :git => 'https://github.com/szhonghaijiang/HHJUnitTextField.git', :tag => '0.0.2'}
  s.source_files = 'HHJUnitTextField', 'HHJUnitTextField/*.swift'
  s.framework = 'UIKit'
  s.requires_arc = true
  s.platform = :ios
  s.ios.deployment_target = '8.0'

end
