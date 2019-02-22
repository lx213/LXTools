//
//  AppVersionCheck.swift
//  mycontrl
//
//  Created by zhonghao on 15/4/15.
//  Copyright (c) 2015年 zhonghao. All rights reserved.
//

import Foundation
open class DefaultCheck{
    var d = UserDefaults.standard
    public func HasDefault(_ DefaultString: String) ->Bool {
        
        if let _: Any = d.object(forKey: DefaultString){
        return true
        }
        return false
    }
    public func GetDefault(_ DefaultString:String)->Any{
        return  d.object(forKey: DefaultString)!
       
    }
    public func SetDefault(_ obj:Any,key:String){
        d.set(obj, forKey: key)
    }
    public func DelDefault(_ key:String){
        
        d.removeObject(forKey: key)
        d.synchronize()
    }
}
