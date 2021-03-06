Pod::Spec.new do |s|
    s.name         = 'LXTools'
    s.version      = '0.1.26'
    s.swift_version = '4.0','4.2' # 项目中使用的Swift版本，多个用“,”隔开
    s.summary      = 'Tools on iOS'
    s.homepage     = 'https://github.com/lx213/LXTools'
    s.license      = 'MIT'
    s.authors      = {'lx123' => '381806973@qq.com'}
    s.platform     = :ios, '8.2'
    s.source       = {:git => 'https://github.com/lx213/LXTools.git', :tag => s.version}
    s.source_files = 'LXTools/**/*'
    s.resource_bundles = {
	'LXAssets' => ['Assets/*']
	}
   s.dependency 'HandyJSON','5.0.0'
s.dependency 'Alamofire','4.9.0'
s.dependency 'Moya/RxSwift','~>13.0.0'
s.dependency 'RxSwift','~>4.0'
s.dependency 'RxCocoa','~>4.0'
s.dependency 'SnapKit'
s.dependency 'YYWebImage'
s.dependency 'IQKeyboardManagerSwift','6.2.0'
s.dependency 'MJRefresh'
s.dependency 'SKPhotoBrowser','6.0.0'
s.dependency 'Parchment','~> 1.7.0'
end