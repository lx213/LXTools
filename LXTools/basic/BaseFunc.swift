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

//计算距离
//func getDistance(lat: String, lng: String) -> String {
//    if AppPM.lng != 0 && AppPM.lat != 0 {
//        let p1 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(NSString(string: lat).doubleValue, NSString(string: lng).doubleValue))
//        let p2 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(AppPM.lat, AppPM.lng))
//        let distance = BMKMetersBetweenMapPoints(p1, p2)
//        if distance <= 1000 {
//            let dstr = "\(Int(distance))m"
//            return dstr
//        }else{
//            let dstr = String(format: "%.1f", distance / 1000.0)
//            return "\(dstr)km"
//        }
//    }else{
//        return ""
//    }
//}

///转换距离单位
func getStrDistance(distance:String) -> String{
    if let d = Double(distance) {
        if d <= 1000 {
            let dstr = "\(Int(d))m"
            return dstr
        }else{
            let dstr = String(format: "%.1f", d / 1000.0)
            return "\(dstr)km"
        }
    }else {
        return distance
    }
}

///读取缓存大小
public func getCacheSize() -> String {
    // 取出cache文件夹目录
    let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
    // 取出文件夹下所有文件数组
    let fileArr = FileManager.default.subpaths(atPath: cachePath!)
    //快速枚举出所有文件名 计算文件大小
    var size = 0
    for file in fileArr! {
        // 把文件名拼接到路径中
        let path = cachePath! + ("/\(file)")
        // 取出文件属性
        let floder = try! FileManager.default.attributesOfItem(atPath: path)
        // 用元组取出文件大小属性
        for (key, fileSize) in floder {
            // 累加文件大小
            if key == FileAttributeKey.size {
                size += (fileSize as AnyObject).integerValue
                
            }
            
        }
        
    }
    let totalCache = Double(size) / 1024.00 / 1024.00
    return "\(String(format: "%.2f", totalCache))M"
}

///清除缓存
public func clearCaches() {
    // 取出cache文件夹目录
    let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
    
    let fileArr = FileManager.default.subpaths(atPath: cachePath!)
    
    // 遍历删除
    
    for file in fileArr! {
        
        let path = (cachePath! as NSString).appending("/\(file)")
        
        if FileManager.default.fileExists(atPath: path) {
            
            do {
                
                try FileManager.default.removeItem(atPath: path)
                
            } catch {
                
                
                
            }
            
        }
        
    }
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

///弹窗确认是否拨打电话
public func AlertPhoneCall(str:String, vc: UIViewController?) {
    GetAlet("是否拨打电话：\(str)", vc: vc) {
        PhoneCall(str: str)
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

/// MARK: - 获取最顶层的ViewController
public func topViewController() -> UIViewController? {
    var resultViewController: UIViewController? = nil
    // 多window的情况下， 需要对window进行有效选择选择
    if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
        resultViewController = __topViewController(object: rootViewController)
        while resultViewController?.presentedViewController != nil {
            resultViewController = resultViewController?.presentedViewController
        }
    }
    return resultViewController
}

private func __topViewController(object: AnyObject!) -> UIViewController? {
    if let navigationController = object as? UINavigationController {
        return __topViewController(object: navigationController.viewControllers.last)
    }
    else if let tabBarController = object as? UITabBarController {
        if tabBarController.selectedIndex < (tabBarController.viewControllers?.count)! {
            return __topViewController(object: tabBarController.viewControllers![tabBarController.selectedIndex])
        }
    }
    else if let vc = object as? UIViewController {
        return vc
    }
    
    return nil
}
///后退层级调转
public func backPush(view: UIViewController, num: Int){
    view.navigationController?.popToViewController((view.navigationController?.viewControllers[(view.navigationController?.viewControllers.count)!-num-1])!, animated: true)
}

///确定取消的闭包回调
public func GetAlet(_ title:String,message:String? = nil,vc:UIViewController?, OK: @escaping () -> ()) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
    let fjky = UIAlertAction(title: "确定" , style: UIAlertActionStyle.default){ (UIAlertAction) -> Void in
        OK()
    }
    alertController.addAction(fjky)
    
    alertController.addAction(cancelAction)
    vc?.present(alertController, animated: true, completion: nil)
}
///确定的闭包回调
public func GetAletOnlyOK(_ title:String,message:String? = nil,vc:UIViewController?, OK: @escaping () -> ()) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let fjky = UIAlertAction(title: "确定" , style: UIAlertActionStyle.default){ (UIAlertAction) -> Void in
        OK()
    }
    alertController.addAction(fjky)
    
    
    vc?.present(alertController, animated: true, completion: nil)
}
///多情况选择项目回调
public func GetAlertList(_ title:String,message:String? = nil,vc:UIViewController?,arr:[String], OK: @escaping (_ index:Int) -> ())  {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
    let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
    for i in 0..<arr.count {
        let ListType = UIAlertAction(title: arr[i] , style: UIAlertActionStyle.default){ (UIAlertAction) -> Void in
            OK(i)
        }
        alertController.addAction(ListType)
    }
    alertController.addAction(cancelAction)
    
    vc?.present(alertController, animated: true, completion: nil)
}
///带输入框的弹窗
public func GetTextAlet(_ title:String,message:String? = nil,vc:UIViewController?,placeholder: String, OK: @escaping (_ text: String) -> ()) {
    var tf = UITextField()
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
    let fjky = UIAlertAction(title: "确定" , style: UIAlertActionStyle.default){ (UIAlertAction) -> Void in
        if tf.getTrim() != "" {
            OK(tf.getTrim())
        }
    }
    alertController.addAction(fjky)
    
    alertController.addAction(cancelAction)
    alertController.addTextField { (textf) in
        tf = textf
        tf.placeholder = placeholder
    }
    vc?.present(alertController, animated: true, completion: nil)
}

///设置nav标题
public func SetVcTitle(vc:UIViewController,title:String){
    if title == "" {
        return
    }
    let font = UIFont.systemFont(ofSize: 16)
    
    
    let titlesize = title.size(withAttributes: [NSAttributedStringKey.font:(font)]) as CGSize
    
    let lab = UILabel(frame: CGRect(origin: CGPoint(x: 0,y: 0), size: titlesize))
    lab.backgroundColor = UIColor.clear
    lab.text = title
    lab.textColor = UIColor.gray
    lab.textAlignment = NSTextAlignment.center
    lab.font = UIFont.boldSystemFont(ofSize: 16)
    vc.navigationController?.navigationBar.isTranslucent = false
    vc.navigationItem.titleView = lab
}
/// 隐藏导航栏
public func TopBarHidden(bool:Bool,v:UIViewController,isstory:Bool = true)  {
    v.navigationController?.setNavigationBarHidden(bool, animated: false)
    v.navigationController?.navigationBar.tintColor = UIColor(valueRGB: 0x1aa0f7)
    if bool {
        
        v.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        v.navigationController?.navigationBar.shadowImage = UIImage()
        v.navigationController?.navigationBar.isTranslucent = true
    }else {
        if let  nv = v.navigationController?.navigationBar {
            let view = UIView(frame: CGRect(x: 0, y: isstory ? 0 : -getTH(vc:v), width: v.view.zj_width , height: getTH(vc:v)))
            view.backgroundColor = UIColor.white
            v.view.insertSubview(view, belowSubview: nv)
            
        }
        v.navigationController?.navigationBar.isTranslucent = true
        
    }
}

///注册消息
public func AddPostNtf(selector:Selector,ntfname:String,obj:AnyObject){
    NotificationCenter.default.addObserver(obj, selector: selector, name: NSNotification.Name(rawValue: ntfname), object: nil)
}
///发送消息
public func PostNotify(Ntfstr:String,obj:AnyObject){
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: Ntfstr), object: obj)
}
///移除消息
public func RemoveNft(obj:AnyObject){
    NotificationCenter.default.removeObserver(obj)
}

///获取storyboard页面
public func GetVCfromStoryboard(Board:String,Identifier:String)->UIViewController{
    let SB = UIStoryboard(name: Board, bundle: Bundle.main)
    
    let VC : UIViewController = SB.instantiateViewController(withIdentifier: Identifier)
    return VC
}


/// 显示提示框
public func AlertShow(msg:String){
    let alert = UIAlertView()
    alert.message = msg
    //        alert.addButtonWithTitle("关闭")
    alert.show()
    delay(time: 1) {
        alert.dismiss(withClickedButtonIndex: 0, animated: true)
    }
}

///是否包含中文
public func isIncludeChinese(str: String) -> Bool {
    for (_,value) in str.characters.enumerated() {
        if ("\u{4E00}" <= value && value <= "\u{9FA5}") {
            return true
        }
    }
    return false
}

// MARK: - 获取联系人姓名首字母(传入汉字字符串, 返回大写拼音首字母)
func getFirstLetterFromString(aString: String) -> (String) {
    // 注意,这里一定要转换成可变字符串
    let mutableString = NSMutableString.init(string: aString)
    // 将中文转换成带声调的拼音
    CFStringTransform(mutableString as CFMutableString, nil, kCFStringTransformToLatin, false)
    // 去掉声调(用此方法大大提高遍历的速度)
    let pinyinString = mutableString.folding(options: String.CompareOptions.diacriticInsensitive, locale: NSLocale.current)
    // 将拼音首字母装换成大写
    let strPinYin = polyphoneStringHandle(nameString: aString, pinyinString: pinyinString).uppercased()
    // 截取大写首字母
    let firstString = strPinYin.substring(to: strPinYin.index(strPinYin.startIndex, offsetBy:1))
    // 判断姓名首位是否为大写字母
    let regexA = "^[A-Z]$"
    let predA = NSPredicate.init(format: "SELF MATCHES %@", regexA)
    return predA.evaluate(with: firstString) ? firstString : "#"
    
}

/// 多音字处理
func polyphoneStringHandle(nameString:String, pinyinString:String) -> String {
    if nameString.hasPrefix("长") {return "chang"}
    if nameString.hasPrefix("沈") {return "shen"}
    if nameString.hasPrefix("厦") {return "xia"}
    if nameString.hasPrefix("地") {return "di"}
    if nameString.hasPrefix("重") {return "chong"}
    if nameString.hasPrefix("曾") {return "zeng"}
    return pinyinString
    
}
