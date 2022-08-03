Pod::Spec.new do |s|
  s.name             = 'SKSwitch'
  s.version          = '1.0'
  s.summary          = '自定义UISwitch'
  s.homepage         = 'https://github.com/kai66666666/SKSwitch.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '孙凯' => '284035051@qq.com' }
  s.source           = { :git => 'https://github.com/kai66666666/SKSwitch.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'file/*.swift'
  s.swift_versions = ['5.0']
  s.dependency 'SnapKit'

end
