//
//  KrtNotifi.swift
//  LXTools
//
//  Created by 廖轩 on 2019/7/17.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation

open class KrtNotifiHelp {
    ///注册消息
    public static func AddPostNtf(selector:Selector,ntfname:String,obj:AnyObject){
        NotificationCenter.default.addObserver(obj, selector: selector, name: NSNotification.Name(rawValue: ntfname), object: nil)
    }
    ///发送消息
    public static func PostNotify(Ntfstr:String,obj:AnyObject?){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Ntfstr), object: obj)
    }
    ///移除消息
    public static func RemoveNft(obj:AnyObject){
        NotificationCenter.default.removeObserver(obj)
    }
}
