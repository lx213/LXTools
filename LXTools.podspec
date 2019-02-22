Pod::Spec.new do |s|
    s.name         = 'LXTools'
    s.version      = '0.0.4'
    s.swift_version = '4.0'
    s.summary      = 'a cardview on iOS'
    s.homepage     = 'https://github.com/lx213/LXTools'
    s.license      = 'MIT'
    s.authors      = {'lx123' => '381806973@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/lx213/LXTools.git', :tag => s.version}
    s.source_files = 'LXTools/**/*.swift'
   s.dependency 'HandyJSON','~> 4.2.0'
s.dependency 'Alamofire','4.5.1'
s.dependency 'Moya/RxSwift','~>11.0'
s.dependency 'RxSwift','~>4.0'
s.dependency 'RxCocoa','~>4.0'
s.dependency 'SnapKit'
s.dependency 'YYWebImage'
s.dependency 'IQKeyboardManagerSwift'
s.dependency 'MJRefresh'
s.dependency 'SKPhotoBrowser','6.0.0'
end