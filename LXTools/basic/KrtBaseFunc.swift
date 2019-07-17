//
//  BaseFunc.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2017/10/20.
//  Copyright © 2017年 廖轩. All rights reserved.
//

import Foundation

public let sw = UIScreen.main.bounds.size.width
public let sh = UIScreen.main.bounds.size.height
public let mpx = UIScreen.main.bounds.size.width / 750
///tabbar高度
public var tbh:CGFloat = 49
public var nh:CGFloat = 65
///导航栏加状态栏高度
public func getTH(vc: UIViewController) -> CGFloat{
    if vc.navigationController == nil {
        return nh + getSbarH()
    }else{
        nh = vc.navigationController!.navigationBar.frame.height
        return vc.navigationController!.navigationBar.frame.height + getSbarH()
    }
}
///状态栏高度
public func getSbarH() -> CGFloat {
    return UIApplication.shared.statusBarFrame.height
}

///添加阴影
public func addShadow(view: UIView, y:CGFloat = 0) {
    let grdLayer = CAGradientLayer()
    let layH:CGFloat = 5
    grdLayer.frame = CGRect(x: 0, y: y, width: sw , height: layH)
    grdLayer.colors = [UIColor(valueRGB: 0x999999, alpha: 0.4).cgColor,UIColor.clear]
    view.layer.addSublayer(grdLayer)
}

///拨打电话
public func PhoneCall(str:String){
    //let filtered = str.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSString.CompareOptions.LiteralSearch, range: nil)
    let filtered = str.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
    if let url = URL(string: "tel://\(filtered)") {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
}

///通过key值来获取对象
public func getValueByKey(obj: Any, key: String) -> Any {
    let m = Mirror(reflecting: obj)
    for case let (l?,v) in m.children {
        if l == key {
            return unwrap(any: v)
        }
    }
    return NSNull()
}
///将可选类型（Option）拆包
func unwrap(any:Any) -> Any {
    let m = Mirror(reflecting: any)
    if m.displayStyle != Mirror.DisplayStyle.optional {
        return any
    }
    
    if m.children.count == 0 {
        return any
    }
    let (_,some) = m.children.first!
    return some
}

public func getType(name: String) -> AnyObject.Type? {
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
    return NSClassFromString("\(namespace).\(name)")
}

/**
 延时
 
 - author: liao xuan
 - date: 16-12-08 11:12:45
 
 - parameter time:
 - parameter closure:
 */
public func delay(time:Double,execute:@escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time, execute: execute)
}







