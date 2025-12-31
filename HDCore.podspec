Pod::Spec.new do |s|
  s.name             = 'HDCore'
  s.version          = '1.0.0'
  s.summary          = 'HDCore'
  s.description      = <<-DESC
                       A longer description of YourPodName.
                       DESC
  s.homepage         = 'https://github.com/zhangdadi/HDCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangdadi' => 'z_dadi@163.com' }
  s.source           = { :git => 'https://github.com/zhangdadi/HDCore', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files = 'HDCoreDemo/HDCore/HDCore.h'
  s.subspec 'extention' do |ss|
    ss.source_files = 'HDCoreDemo/HDCore/extention/**/*'
  end
  s.subspec 'macro' do |ss|
    ss.source_files = 'HDCoreDemo/HDCore/macro/**/*'
  end
  s.subspec 'Utilities' do |ss|
    ss.source_files = 'HDCoreDemo/HDCore/Utilities/**/*'
  end
end
