//
//  AppVersionCheck.swift
//  mycontrl
//
//  Created by zhonghao on 15/4/15.
//  Copyright (c) 2015年 zhonghao. All rights reserved.
//

import Foundation
open class DefaultCheck{
    
    public func HasDefault(_ DefaultString: String) ->Bool {
        
        if let _: Any = UserDefaults.standard.object(forKey: DefaultString){
        return true
        }
        return false
    }
    public func GetDefault(_ DefaultString:String)->Any{
        return  UserDefaults.standard.object(forKey: DefaultString)!
       
    }
    public func SetDefault(_ obj:Any,key:String){
        UserDefaults.standard.set(obj, forKey: key)
    }
    public func DelDefault(_ key:String){
        
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
