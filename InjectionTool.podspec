Pod::Spec.new do |s|
  s.name             = 'InjectionTool'
  s.version          = '1.0.1'
  s.summary          = 'InjectionTool is a tool for InjectionIII'
  s.description      = <<-DESC
                          You can download the macOS app InjectionIII from the macOS AppStore,
                          use this tool by pod,
                          No need to write any code,
                          Happy to enjoy the hot reload to dynamic develop UI.
                          DESC
  s.homepage         = 'https://github.com/Todaycoding/InjectionTool'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DevDragonLi' => 'dragonLi@88.com' }
  s.source           = { :git => 'https://github.com/Todaycoding/InjectionTool.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  
  s.static_framework = true
  
  s.vendored_libraries = '*.a'
  
end
