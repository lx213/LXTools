//
//  AppVersionCheck.swift
//  mycontrl
//
//  Created by zhonghao on 15/4/15.
//  Copyright (c) 2015年 zhonghao. All rights reserved.
//

import Foundation
open class KrtDefaultHelp{
    
    ///是否存在键值
    public static func HasDefault(_ DefaultString: String) ->Bool {
        
        if let _: Any = UserDefaults.standard.object(forKey: DefaultString){
        return true
        }
        return false
    }
    
    ///读取存储内容
    public static func GetDefault(_ DefaultString:String)->Any{
        return  UserDefaults.standard.object(forKey: DefaultString)!
       
    }
    
    ///设置存储内容
    public static func SetDefault(_ obj:Any,key:String){
        UserDefaults.standard.set(obj, forKey: key)
    }
    
    ///删除存储内容
    public static func DelDefault(_ key:String){
        
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
