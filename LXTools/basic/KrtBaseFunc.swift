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
public var nh:CGFloat = 44
public var bottomSAHeight:CGFloat = 0.0
public func getBottomHeight() {
    if #available(iOS 11.0, *) {
        bottomSAHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0
    } else {
        // Fallback on earlier versions
    }
}
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

/// 将给定的图像进行拉伸,并且返回新的图像
///
/// - Parameters:
///   - image: 原图
///   - size: 目标尺寸
/// - Returns: 返回一个新的'目标尺寸'的图像
public func avatarImage(image: UIImage, size: CGSize) -> UIImage? {
 
    let rect = CGRect(origin: CGPoint(), size: size)
 
    // 1.图像的上下文-内存中开辟一个地址,跟屏幕无关
    /**
     * 1.绘图的尺寸
     * 2.不透明:false(透明) / true(不透明)
     * 3.scale:屏幕分辨率,默认情况下生成的图像使用'1.0'的分辨率,图像质量不好
     *         可以指定'0',会选择当前设备的屏幕分辨率
     */
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
 
    // 2.绘图'drawInRect'就是在指定区域内拉伸屏幕
    image.draw(in: rect)
 
    // 3.取得结果
    let result = UIGraphicsGetImageFromCurrentImageContext()
 
    // 4.关闭上下文
    UIGraphicsEndImageContext()
 
    // 5.返回结果
    return result
}





