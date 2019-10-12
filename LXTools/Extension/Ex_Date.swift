//
//  DateEx.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2018/12/25.
//  Copyright © 2018 赣州科睿特软件. All rights reserved.
//

import Foundation

extension Date {
    ///是否是今天
    public func isToday() -> Bool{
        return Calendar.current.isDateInToday(self)
    }
    ///是否是明天
    public func isTomorrow() -> Bool{
        return Calendar.current.isDateInTomorrow(self)
    }
    ///是否是昨天
    public func isYesterday() -> Bool{
        return Calendar.current.isDateInYesterday(self)
    }
    ///是否是周末
    public func isWeekend() -> Bool{
        return Calendar.current.isDateInWeekend(self)
    }
    ///转字符串
    public func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
    ///年
    public func year() -> Int {
        let c = Calendar.current
        let com = c.dateComponents([.year], from: self)
        return com.year!
    }
    ///月
    public func month() -> Int {
        let c = Calendar.current
        let com = c.dateComponents([.month], from: self)
        return com.month!
    }
    ///日
    public func day() -> Int {
        let c = Calendar.current
        let com = c.dateComponents([.day], from: self)
        return com.day!
    }
    ///时
    public func hour() -> Int {
        let c = Calendar.current
        let com = c.dateComponents([.hour], from: self)
        return com.hour!
    }
    ///分
    public func minute() -> Int {
        let c = Calendar.current
        let com = c.dateComponents([.minute], from: self)
        return com.minute!
    }
    
    ///日期增加
    public func addDate(year: Int = 0, month: Int = 0, day: Int = 0, hour: Int = 0, minute: Int = 0, second : Int = 0) -> Date {
        var com1 = DateComponents()
        com1.year = year
        com1.month = month
        com1.day = day
        com1.hour = hour
        com1.minute = minute
        com1.second = second
        let eDate = Calendar.current.date(byAdding: com1, to: self)
        return eDate!
    }
    
    ///日期减少
    public func deffDate(year: Int = 0, month: Int = 0, day: Int = 0, hour: Int = 0, minute: Int = 0, second : Int = 0) -> Date {
        var com1 = DateComponents()
        com1.year = -year
        com1.month = -month
        com1.day = -day
        com1.hour = -hour
        com1.minute = -minute
        com1.second = -second
        let eDate = Calendar.current.date(byAdding: com1, to: self)
        return eDate!
    }
    
    ///计算日期相差天数
    public func daysBetweenDate(toDate: Date) -> Int {
        //给结束时间加1分钟，保证能计算出1天时间差
        var com1 = DateComponents()
        com1.minute = 1
        let eDate = Calendar.current.date(byAdding: com1, to: toDate)
        let components = Calendar.current.dateComponents([.day], from: self, to: eDate!)
        return components.day ?? 0
    }
    
    ///计算日期相差分钟
    public func minsBetweenDate(toDate: Date) -> Int {
        //给结束时间加1秒
        var com1 = DateComponents()
        com1.second = 1
        let eDate = Calendar.current.date(byAdding: com1, to: toDate)
        let components = Calendar.current.dateComponents([.minute], from: self, to: eDate!)
        return components.minute ?? 0
    }
    
    ///计算日期相差秒
    public func secBetweenDate(toDate: Date) -> Int {
        //给结束时间加1秒
        //        var com1 = DateComponents()
        //        com1.second = 1
        //        let eDate = Calendar.current.date(byAdding: com1, to: toDate)
        let components = Calendar.current.dateComponents([.second], from: self, to: toDate)
        return components.second ?? 0
    }
}
