Pod::Spec.new do |s|
  s.name                = "SwiftyEcharts"
  s.version             = "0.0.2"
  s.summary             = "A custom component for the ecomfe's echarts 3."
  s.homepage            = "https://github.com/Pluto-Y/SwiftyEcharts"
  s.license             = { :type => "MIT", :file => 'LICENSE' }
  s.author              = { "PlutoY" => "kuaileainits@163.com" }
  #s.platform            = :ios, "8.0"
  s.source              = { :git => "https://github.com/Pluto-Y/SwiftyEcharts.git", :tag => s.version}
  s.source_files        = "SwiftyEcharts/**/*.{h,swift}" 
  s.resource_bundles    = { 'SwiftyEcharts' => 'SwiftyEcharts/Resources/**' }
  s.requires_arc        = true
  s.ios.frameworks          = 'UIKit'
  s.ios.deployment_target = '8.0'
end
