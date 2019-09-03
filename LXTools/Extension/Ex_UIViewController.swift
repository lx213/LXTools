//
//  AllExtension.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2017/10/20.
//  Copyright © 2017年 廖轩. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    ///push到下一页
    public func pushToView(vc: UIViewController, ani: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: ani)
    }
    
    ///push返回上一页
    public func pushBack(ani: Bool = true) {
        self.navigationController?.popViewController(animated: ani)
    }
    
    ///present到下一页
    public func presentToView(vc: UIViewController, ani: Bool = true, completion: (() -> Void)? = nil) {
        self.present(vc, animated: ani, completion: completion)
    }
    
    ///present返回上一页
    public func presentBack(ani: Bool = true, completion: (() -> Void)? = nil) {
        self.dismiss(animated: ani, completion: completion)
    }
    
    ///后退层级调转
    public func backPush(num: Int){
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)!-num-1])!, animated: true)
    }
    
    ///设置nav标题
    public func SetVcTitle(title:String){
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
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.titleView = lab
    }
    /// 隐藏导航栏
    public func TopBarHidden(bool:Bool,isstory:Bool = true,isTranslucent:Bool = true)  {
        self.navigationController?.setNavigationBarHidden(bool, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor(valueRGB: 0x1aa0f7)
        if bool {
            
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
        }else {
            if let  nv = self.navigationController?.navigationBar {
                let view = UIView(frame: CGRect(x: 0, y: isstory ? 0 : -getTH(vc:self), width: self.view.zj_width , height: isTranslucent ? getTH(vc:self) : 0))
                view.backgroundColor = UIColor.white
                self.view.insertSubview(view, belowSubview: nv)
                
            }
            if !isstory {
                self.edgesForExtendedLayout = []
            }
            self.navigationController?.navigationBar.isTranslucent = true
            
        }
    }
    
    //利用runtime指定方法实现
    public func runtimeRemoveAlert() -> Void {
        if let presentM = class_getInstanceMethod(type(of: self), #selector(present(_:animated:completion:))),
            let presentSwizzlingM = class_getInstanceMethod(type(of: self), #selector(temporary_present(_:animated:completion:))){
            method_exchangeImplementations(presentM, presentSwizzlingM)
        }
    }
    //利用runtime恢复方法实现
    public func runtimeResetAlert() -> Void {
        if let presentM = class_getInstanceMethod(type(of: self), #selector(present(_:animated:completion:))),
            let presentSwizzlingM = class_getInstanceMethod(type(of: self), #selector(temporary_present(_:animated:completion:))){
            method_exchangeImplementations(presentM, presentSwizzlingM)
        }
    }
    
    //在自己实现中特殊处理
    @objc dynamic func temporary_present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil){
        if viewControllerToPresent.isKind(of: UIAlertController.self) {
            if let alertController = viewControllerToPresent as? UIAlertController{
                //通过判断title和message都为nil，得知是替换icon触发的提示。
                if alertController.title == nil && alertController.message == nil && alertController.preferredStyle == .alert {
                    return;
                }
            }
        }
        
        self.temporary_present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
