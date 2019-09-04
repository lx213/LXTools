//
//  KrtAlert.swift
//  LXTools
//
//  Created by 廖轩 on 2019/7/17.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation

open class KrtAlertHelp {
    ///确定取消的闭包回调
    public static func GetAlet(_ title:String? = nil,message:String? = nil,vc:UIViewController?,Cancel: (() -> ())? = nil, OK: @escaping () -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel){ (UIAlertAction) -> Void in
            if Cancel != nil {
                Cancel!()
            }
        }
        let fjky = UIAlertAction(title: "确定" , style: UIAlertActionStyle.default){ (UIAlertAction) -> Void in
            OK()
        }
        alertController.addAction(fjky)
        
        alertController.addAction(cancelAction)
        vc?.present(alertController, animated: true, completion: nil)
    }
    ///确定的闭包回调
    public static func GetAletOnlyOK(_ title:String? = nil,message:String? = nil,vc:UIViewController?, OK: @escaping () -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let fjky = UIAlertAction(title: "确定" , style: UIAlertActionStyle.default){ (UIAlertAction) -> Void in
            OK()
        }
        alertController.addAction(fjky)
        
        
        vc?.present(alertController, animated: true, completion: nil)
    }
    ///多情况选择项目回调
    public static func GetAlertList(_ title:String? = nil,message:String? = nil,vc:UIViewController?,arr:[String], OK: @escaping (_ index:Int) -> ())  {
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
    public static func GetTextAlet(_ title:String? = nil,message:String? = nil,vc:UIViewController?,placeholder: String, OK: @escaping (_ text: String) -> ()) {
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
    
    /// 显示提示框
    public static func AlertShow(msg:String){
        let alert = UIAlertView()
        alert.message = msg
        //        alert.addButtonWithTitle("关闭")
        alert.show()
        delay(time: 1) {
            alert.dismiss(withClickedButtonIndex: 0, animated: true)
        }
    }
}
