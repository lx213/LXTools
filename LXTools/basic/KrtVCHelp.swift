//
//  KrtVCHelp.swift
//  LXTools
//
//  Created by 廖轩 on 2019/7/17.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation

open class KrtVCHelp {
    ///获取最顶层的ViewController
    public static func topViewController() -> UIViewController? {
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
    
    private static func __topViewController(object: AnyObject!) -> UIViewController? {
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
    
    
    
    
    ///获取storyboard页面
    public static func GetVCfromStoryboard(Board:String,Identifier:String)->UIViewController{
        let SB = UIStoryboard(name: Board, bundle: Bundle.main)
        
        let VC : UIViewController = SB.instantiateViewController(withIdentifier: Identifier)
        return VC
    }
}
