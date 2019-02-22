//
//  KRTLog.swift
//  test
//
//  Created by 廖轩 on 2018/2/23.
//  Copyright © 2018年 廖轩. All rights reserved.
//

import Foundation

public struct KrtLog {
    
    public static func debug<T>(message: T,file: String = #file,method: String = #function,line: Int = #line) {
        #if DEBUG
            let fname = (file as NSString).lastPathComponent
            let now = getTime()
            print("\n\(now) 💚 DEBUG [\(fname)][\(method)](\(line)): \(message)")
        #endif
    }
    
    public static func info<T>(message: T,file: String = #file,method: String = #function,line: Int = #line) {
        #if DEBUG
            let fname = (file as NSString).lastPathComponent
            let now = getTime()
            print("\n\(now) 💙 INFO [\(fname)][\(method)](\(line)): \(message)")
        #endif
    }
    
    public static func warn<T>(message: T,file: String = #file,method: String = #function,line: Int = #line) {
        #if DEBUG
            let fname = (file as NSString).lastPathComponent
            let now = getTime()
            print("\n\(now) 💛 WARNING [\(fname)][\(method)](\(line)): \(message)")
        #endif
    }
    
    public static func error<T>(message: T,file: String = #file,method: String = #function,line: Int = #line) {
        #if DEBUG
            let fname = (file as NSString).lastPathComponent
            let now = getTime()
            print("\n\(now) ❤️ ERROR [\(fname)][\(method)](\(line)): \(message)")
        #endif
    }
    
    public static func getTime() -> String {
        let df = DateFormatter()
        df.dateFormat = "hh:mm:ss.SSS"
        return df.string(from: Date())
    }
}

