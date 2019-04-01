//
//  Ex_String.swift
//  LXTools
//
//  Created by 廖轩 on 2019/4/1.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    ///过滤空格
    public func trim() -> String{
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    ///转日期格式
    public func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
    
    ///字符长度
    public var length_ex: Int {
        return self.characters.count
        
    }
    
    public subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    ///截取index开始到末尾的字符串
    public func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length_ex) ..< length_ex]
        
    }
    public func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
        
    }
    public subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length_ex, r.lowerBound)), upper: min(length_ex, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
        
    }
    public func dropLast(_ n: Int = 1) -> String {
        return String(characters.dropLast(n))
    }
    public var dropLast: String {
        return dropLast()
    }
    
    public var PinyinFirst : Dictionary<String,String>{
        
        
        
        let A = ["z", "q", "s", "l", "z", "w", "z", "w", "f", "c", "c", "w", "j", "s", "h", "y", "z", "q", "y", "x", "h", "L", "s", "z", "k", "c", "y", "h", "j", "w", "t", "j", "q", "x", "z", "y", "b", "s", "d", "z", "y", "s", "p", "g", "x", "f", "p", "L", "L", "w", "c", "m", "m", "f", "h", "f", "y", "R", "y", "L", "f", "b", "s", "t", "f", "L", "c", "x", "L", "h", "n", "t", "t", "y", "L", "b", "h", "w", "ā", "c", "y", "y", "s", "f", "p", "b", "q", "k", "w", "y", "y", "b", "g", "m", "p", "h", "h", "m", "x", "y", "y", "s", "z", "w", "q", "m", "y", "d", "m", "b", "m", "z", "j", "f", "c", "d", "t", "s", "m", "p", "x", "j", "s", "q", "x", "z", "d", "L", "d", "R", "L", "m", "x", "j", "m", "q", "j", "L", "L", "w", "j", "t", "y", "g", "m", "s", "L", "d", "z", "x", "q", "L", "g", "x", "c", "t", "f", "h", "L", "h", "y", "w", "z", "k", "z", "g", "L", "m", "j", "f", "q", "m", "g", "x", "y", "z", "d", "x", "b", "d", "y", "s", "h", "h", "b", "z", "z", "s", "c", "j", "n", "g", "c", "j", "x", "h", "p", "L", "R", "w", "x", "y", "y", "h", "z", "q", "j", "f", "R", "y", "c", "j", "j", "b", "m", "s", "j", "d", "f", "w", "w", "j", "b", "g", "m", "k", "s", "g", "c", "h", "f", "p", "q", "x", "b", "y", "q", "z", "y", "g", "n", "q", "L", "b", "g", "t", "L", "R", "z", "w", "f", "L", "j", "z", "s", "L", "y", "x", "s", "s", "g", "L", "j", "b", "y", "s", "b", "h", "p", "t", "c", "è", "s", "x", "j", "L", "z", "L", "t", "m", "c", "q", "y", "y", "x", "n", "c", "s", "w", "s", "d", "z", "t", "g", "L", "p", "j", "s", "f", "d", "R", "z", "L", "y", "x", "q", "s", "g", "p", "n", "s", "t", "b", "h", "y", "j", "j", "p", "s", "n", "w", "b", "z", "y", "c", "q", "y", "c", "m", "L", "R", "x", "h", "à", "y", "R", "x", "g", "y", "s", "g", "L", "y", "z", "j", "j", "h", "b", "d", "g", "m", "h", "k", "g", "w", "k", "g", "L", "q", "d", "ō", "s", "w", "L", "y", "y", "k", "L", "s", "g", "s", "n", "c", "g", "á", "R", "L", "z", "x", "k", "n", "j", "R", "k", "z", "w", "s", "n", "y", "j", "x", "f", "c", "g", "k", "x", "z", "h", "j", "h", "y", "z", "q", "L", "g", "y", "h", "g", "m", "q", "s", "m", "s", "g", "o", "y", "x", "h", "z", "g", "w", "r", "d", "f", "h", "l", "h", "f", "y", "c", "g", "y", "t", "t", "g", "y", "z", "z", "p", "y", "c", "y", "c", "y", "t", "s", "s", "t", "g", "s", "z", "s", "x", "y", "L", "h", "z", "l", "y", "w", "z", "s", "m", "r", "x", "y", "L", "q", "s", "t", "s", "k", "q", "g", "s", "k", "z", "d", "z", "j", "z", "s", "d", "m", "w", "m", "g", "x", "q", "d", "y", "z", "R", "s", "g", "l", "t", "b", "j", "g", "z", "f", "g", "l", "j", "c", "y", "f", "r", "y", "t", "q", "d", "g", "b", "l", "d", "g", "n", "m", "h", "y", "g", "h", "y", "s", "w", "s", "y", "s", "g", "k", "k", "h", "y", "q", "L", "q", "z", "q", "d", "m", "x", "m", "s", "m", "s", "n", "b", "s", "n", "g", "m", "h", "q", "d", "n", "a", "y", "t", "d", "w", "y", "f", "b", "j", "x", "z"]
        let B = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈", "韩", "杨", "朱", "秦", "尤", "许", "何", "吕", "施", "张", "孔", "曹", "严", "华", "金", "魏", "陶", "姜", "戚", "谢", "邹", "喻", "柏", "水", "窦", "章", "云", "苏", "潘", "葛", "奚", "范", "彭", "郎", "鲁", "韦", "昌", "马", "苗", "凤", "花", "方", "俞", "任", "袁", "柳", "酆", "鲍", "史", "唐", "费", "廉", "岑", "薛", "雷", "贺", "倪", "汤", "滕", "殷", "罗", "毕", "郝", "邬", "安", "常", "乐", "于", "时", "傅", "皮", "卞", "齐", "康", "伍", "余", "元", "卜", "顾", "孟", "平", "黄", "和", "穆", "萧", "尹", "姚", "邵", "湛", "汪", "祁", "毛", "禹", "狄", "米", "贝", "明", "臧", "计", "伏", "成", "戴", "谈", "宋", "茅", "庞", "熊", "纪", "舒", "屈", "项", "祝", "董", "梁", "杜", "阮", "蓝", "闵", "席", "季", "麻", "强", "贾", "路", "娄", "危", "江", "童", "颜", "郭", "梅", "盛", "林", "刁", "钟", "徐", "邱", "骆", "高", "夏", "蔡", "田", "樊", "胡", "凌", "霍", "虞", "万", "支", "柯", "昝", "管", "卢", "莫", "经", "房", "裘", "缪", "干", "解", "应", "宗", "丁", "宣", "贲", "邓", "郁", "单", "杭", "洪", "包", "诸", "左", "石", "崔", "吉", "钮", "龚", "程", "嵇", "邢", "滑", "裴", "陆", "荣", "翁", "荀", "羊", "於", "惠", "甄", "曲", "家", "封", "芮", "羿", "储", "靳", "汲", "邴", "糜", "松", "井", "段", "富", "巫", "乌", "焦", "巴", "弓", "牧", "隗", "山", "谷", "车", "侯", "宓", "蓬", "全", "郗", "班", "仰", "秋", "仲", "伊", "宫", "宁", "仇", "栾", "暴", "甘", "钭", "厉", "戎", "祖", "武", "符", "刘", "景", "詹", "束", "龙", "叶", "幸", "司", "韶", "郜", "黎", "蓟", "薄", "印", "宿", "白", "怀", "蒲", "邰", "从", "鄂", "索", "咸", "籍", "赖", "卓", "蔺", "屠", "蒙", "池", "乔", "阴", "鬱", "胥", "能", "苍", "双", "闻", "莘", "党", "翟", "谭", "贡", "劳", "逄", "姬", "申", "扶", "堵", "冉", "宰", "郦", "雍", "卻", "璩", "桑", "桂", "濮", "牛", "寿", "通", "边", "扈", "燕", "冀", "郏", "浦", "尚", "农", "温", "别", "庄", "晏", "柴", "瞿", "阎", "充", "慕", "连", "茹", "习", "宦", "艾", "鱼", "容", "向", "古", "易", "慎", "戈", "廖", "庾", "终", "暨", "居", "衡", "步", "都", "耿", "满", "弘", "匡", "国", "文", "寇", "广", "禄", "阙", "东", "欧", "殳", "沃", "利", "蔚", "越", "夔", "隆", "师", "巩", "厍", "聂", "晁", "勾", "敖", "融", "冷", "訾", "辛", "阚", "那", "简", "饶", "空", "曾", "毋", "沙", "乜", "养", "鞠", "须", "丰", "巢", "关", "蒯", "相", "查", "后", "荆", "红", "游", "竺", "权", "逯", "盖", "益", "桓", "公", "万", "俟", "司", "马", "上", "官", "欧", "阳", "夏", "侯", "诸", "葛", "闻", "人", "东", "方", "赫", "连", "皇", "甫", "尉", "迟", "公", "羊", "澹", "台", "公", "冶", "宗", "政", "濮", "阳", "淳", "于", "单", "于", "太", "叔", "申", "屠", "公", "孙", "仲", "孙", "轩", "辕", "令", "狐", "钟", "离", "宇", "文", "长", "孙", "慕", "容", "鲜", "于", "闾", "丘", "司", "徒", "司", "空", "丌", "官", "司", "寇", "仉", "督", "子", "车", "颛", "孙", "端", "木", "巫", "马", "公", "西", "漆", "雕", "乐", "正", "壤", "驷", "公", "良", "拓", "跋", "夹", "谷", "宰", "父", "谷", "梁", "晋", "楚", "闫", "法", "汝", "鄢", "涂", "钦", "段", "干", "百", "里", "东", "郭", "南", "门", "呼", "延", "归", "海", "羊", "舌", "微", "生", "岳", "帅", "缑", "亢", "况", "郈", "有", "琴", "梁", "丘", "左", "丘", "东", "门", "西", "门", "商", "牟", "佘", "佴", "伯", "赏", "南", "宫", "墨", "哈", "谯", "笪", "年", "爱", "阳", "佟", "第", "五", "言", "福", "百", "家", "姓", "终"]
        
        
        var dct  = Dictionary<String,String>()
        for i in 0..<B.count  {
            dct[B[i]] = A[i]
        }
        return dct
        //        var s = "{"
        //        for (key,value) in dct {
        //            s.append("\"\(key)\":\"\(value)\",")
        //        }
        //        s.append("}")
        //
        //         print(s)
        //
        
        
        
        
        
        
    }
    public var todctSS :Dictionary<String,AnyObject>{
        var dct = Dictionary<String,AnyObject>()
        do{
            dct = try JSONSerialization.jsonObject(with: self.data(using: String.Encoding.utf8 )!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,AnyObject>
        }catch let error as NSError{
            KrtLog.error(message:"\(error.localizedDescription)")
        }
        return dct
    }
    public var md5 : String{
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen);
        
        CC_MD5(str!, strLen, result);
        
        let hash = NSMutableString();
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i]);
        }
        result.deinitialize();
        
        return String(format: hash as String)
    }
    public func isTelNumber()->Bool
    {
        let num = self
        let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)"
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)"
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: num) == true)
            || (regextestcm.evaluate(with: num)  == true)
            || (regextestct.evaluate(with: num) == true)
            || (regextestcu.evaluate(with: num) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }
    ///手机号格式化
    public func ReSetPhone()->String{
        let num = self
        if num.characters.count < 11 {
            return ""
        }
        var phone = num
        for item in phone.characters{
            if let _  = Int(String(item)) {
                
            }else{
                phone = phone.replacingOccurrences(of: String(item), with: "")
            }
        }
        phone = NSString(string: phone).substring(from: phone.characters.count-11)
        if  !phone.isTelNumber(){
            return ""
        }
        return phone
    }
    /// 是否包含中文
    public func isIncludeChinese() -> Bool {
        return LXTools.isIncludeChinese(str: self)
    }
    ///拨打电话
    public func PhoneCall(vc:UIViewController?){
        AlertPhoneCall(str: self, vc: vc)
    }
    
    public var utfData: Data? {
        return self.data(using: .utf8)
    }
    
    public var attributedHtmlString: NSAttributedString? {
        guard let data = self.utfData else {
            return nil
        }
        do {
            return try NSAttributedString(data: data,
                                          options: [
                                            .documentType: NSAttributedString.DocumentType.html,
                                            .characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        } catch {
            KrtLog.error(message:error.localizedDescription)
            return nil
        }
    }
    
    ///验证身份证
    public func isTrueIDNumber() -> Bool{
        var value = self
        value = value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        var length : Int = 0
        length = value.characters.count
        if length != 15 && length != 18{
            //不满足15位和18位，即身份证错误
            return false
        }
        // 省份代码
        let areasArray = ["11","12", "13","14", "15","21", "22","23", "31","32", "33","34", "35","36", "37","41", "42","43", "44","45", "46","50", "51","52", "53","54", "61","62", "63","64", "65","71", "81","82", "91"]
        
        // 检测省份身份行政区代码
        let index = value.index(value.startIndex, offsetBy: 2)
        let valueStart2 = value.substring(to: index)
        
        //标识省份代码是否正确
        var areaFlag = false
        for areaCode in areasArray {
            if areaCode == valueStart2 {
                areaFlag = true
                break
            }
        }
        
        if !areaFlag {
            return false
        }
        var regularExpression : NSRegularExpression?
        var numberofMatch : Int?
        var year = 0
        
        switch length {
        case 15:
            //获取年份对应的数字
            let valueNSStr = value as NSString
            let yearStr = valueNSStr.substring(with: NSRange.init(location: 6, length: 2)) as NSString
            year = yearStr.integerValue + 1900
            if year % 4 == 0 || (year % 100 == 0 && year % 4 == 0) {
                //创建正则表达式 NSRegularExpressionCaseInsensitive：不区分字母大小写的模式
                //测试出生日期的合法性
                regularExpression = try! NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$", options: NSRegularExpression.Options.caseInsensitive)
            }else{
                //测试出生日期的合法性
                regularExpression = try! NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$", options: NSRegularExpression.Options.caseInsensitive)
            }
            numberofMatch = regularExpression?.numberOfMatches(in: value, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSRange.init(location: 0, length: value.characters.count))
            if numberofMatch! > 0 {
                return true
            }else{
                return false
            }
        case 18:
            let valueNSStr = value as NSString
            let yearStr = valueNSStr.substring(with: NSRange.init(location: 6, length: 4)) as NSString
            year = yearStr.integerValue
            if year % 4 == 0 || (year % 100 == 0 && year % 4 == 0) {
                //测试出生日期的合法性
                regularExpression = try! NSRegularExpression.init(pattern: "^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$", options: NSRegularExpression.Options.caseInsensitive)
            }else{
                //测试出生日期的合法性
                regularExpression = try! NSRegularExpression.init(pattern: "^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$", options: NSRegularExpression.Options.caseInsensitive)
            }
            numberofMatch = regularExpression?.numberOfMatches(in: value, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSRange.init(location: 0, length: value.characters.count))
            if numberofMatch! > 0 {
                let a = getStringByRangeIntValue(Str: valueNSStr, location: 0, length: 1) * 7
                let b = getStringByRangeIntValue(Str: valueNSStr, location: 10, length: 1) * 7
                let c = getStringByRangeIntValue(Str: valueNSStr, location: 1, length: 1) * 9
                let d = getStringByRangeIntValue(Str: valueNSStr, location: 11, length: 1) * 9
                let e = getStringByRangeIntValue(Str: valueNSStr, location: 2, length: 1) * 10
                let f = getStringByRangeIntValue(Str: valueNSStr, location: 12, length: 1) * 10
                let g = getStringByRangeIntValue(Str: valueNSStr, location: 3, length: 1) * 5
                let h = getStringByRangeIntValue(Str: valueNSStr, location: 13, length: 1) * 5
                let i = getStringByRangeIntValue(Str: valueNSStr, location: 4, length: 1) * 8
                let j = getStringByRangeIntValue(Str: valueNSStr, location: 14, length: 1) * 8
                let k = getStringByRangeIntValue(Str: valueNSStr, location: 5, length: 1) * 4
                let l = getStringByRangeIntValue(Str: valueNSStr, location: 15, length: 1) * 4
                let m = getStringByRangeIntValue(Str: valueNSStr, location: 6, length: 1) * 2
                let n = getStringByRangeIntValue(Str: valueNSStr, location: 16, length: 1) * 2
                let o = getStringByRangeIntValue(Str: valueNSStr, location: 7, length: 1) * 1
                let p = getStringByRangeIntValue(Str: valueNSStr, location: 8, length: 1) * 6
                let q = getStringByRangeIntValue(Str: valueNSStr, location: 9, length: 1) * 3
                let S = a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q
                let Y = S % 11
                var M = "F"
                let JYM = "10X98765432"
                M = (JYM as NSString).substring(with: NSRange.init(location: Y, length: 1))
                let lastStr = valueNSStr.substring(with: NSRange.init(location: 17, length: 1))
                if lastStr == "x" {
                    if M == "X" {
                        return true
                    }else{
                        return false
                    }
                }else{
                    if M == lastStr {
                        return true
                    }else{
                        return false
                    }
                }
            }else{
                return false
            }
        default:
            return false
        }
    }
    public func getStringByRangeIntValue(Str : NSString,location : Int, length : Int) -> Int{
        let a = Str.substring(with: NSRange(location: location, length: length))
        let intValue = (a as NSString).integerValue
        return intValue
    }
    
    public func isPurnInt() -> Bool {
        
        let scan: Scanner = Scanner(string: self)
        
        var val:Int = 0
        
        return scan.scanInt(&val) && scan.isAtEnd
        
    }
    
    public func isPurnDouble() -> Bool {
        
        let scan: Scanner = Scanner(string: self)
        
        var val:Double = 0
        
        return scan.scanDouble(&val) && scan.isAtEnd
        
    }
    public func isPurnFloat() -> Bool {
        
        let scan: Scanner = Scanner(string: self)
        
        var val:Float = 0
        
        return scan.scanFloat(&val) && scan.isAtEnd
        
    }
}
