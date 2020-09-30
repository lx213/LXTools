//
//  Ex_UILabel.swift
//  LXTools
//
//  Created by 廖轩 on 2019/4/1.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation
extension UILabel {
    ///设置文本内容
    public func msetText(text: String) -> Self {
        self.text = text
        return self
    }
    
    ///设置字体大小
    public func msetFont(size: CGFloat) -> Self {
        self.font = UIFont.systemFont(ofSize: size)
        return self
    }
    
    ///设置粗体字
    public func msetBFont(size: CGFloat) -> Self {
        self.font = UIFont.boldSystemFont(ofSize: size)
        return self
    }
    
    ///设置自定义粗体字
    public func msetBFont(size: CGFloat,weight: UIFont.Weight) -> Self {
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        return self
    }
    
    ///设置字体颜色
    public func msetTextColor(color: UIColor?) -> Self {
        self.textColor = color
        return self
    }
    
    ///设置字体颜色
    public func msetTextColor(color: Int) -> Self {
        self.textColor = UIColor(hex: color)
        return self
    }
    
    ///设置字体颜色
    public func msetTextColor(color: String) -> Self {
        self.textColor = UIColor(hexString: color)
        return self
    }
    
    ///设置文本对齐
    public func msetTextAlignment(ali: NSTextAlignment) -> Self {
        self.textAlignment = ali
        return self
    }
    
    ///设置行数
    public func msetLineNumber(num: Int) -> Self {
        _ = UILabel()
        self.numberOfLines = num
        return self
    }
    
    ///计算文本控件尺寸
    public func getLabelSize(maxwidth: CGFloat) -> CGSize{
        if self.text == "" {
            return CGSize.zero
        }
        //        let textns = NSString(CString: self.text!.cStringUsingEncoding(NSUTF8StringEncoding)!, encoding: NSUTF8StringEncoding.rawValue)!
        let textns = NSString.init(cString: self.text!.cString(using: String.Encoding.utf8)!, encoding: String.Encoding.utf8.rawValue)!
        let textbound1 =  textns.boundingRect(with: CGSize.zero, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : self.font], context: nil)
        if textbound1.width <= maxwidth {
            return CGSize(width: textbound1.width+5, height: textbound1.height)
        }else{
            let tb2 = textns.boundingRect(with: CGSize(width: maxwidth, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : self.font], context: nil)
            return CGSize(width: maxwidth, height: tb2.height+5)
        }
    }
}
