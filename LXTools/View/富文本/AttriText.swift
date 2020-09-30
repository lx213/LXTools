//
//  AttriText.swift
//  LXTools
//
//  Created by 廖轩 on 2020/9/30.
//  Copyright © 2020 廖轩. All rights reserved.
//

import Foundation

public struct AttriTextOpt {
    ///文本内容
    var str = ""
    ///字体大小
    var font:CGFloat = 14
    ///是否粗体字
    var bold = false
    ///字体颜色
    var color:UIColor = .black
    ///划线模式（0：无划线，1：中划线，2：下划线）
    var lineMode = 0
    ///字宽
    var fontWeight = UIFont.Weight.regular
    ///行间距
    var lineSpacing:CGFloat = 0.0
}

extension UILabel {
    public func msetAttriText(text: [AttriTextOpt]) -> Self {
        let mus = NSMutableAttributedString()
        for item in text {
            var opts:[NSAttributedString.Key:Any] = [NSAttributedString.Key.font :  UIFont.systemFont(ofSize: item.font,weight: item.bold ? UIFont.Weight.bold : item.fontWeight) ,NSAttributedString.Key.foregroundColor:item.color]
            if item.lineMode == 1 {
                ///中划线
                opts[NSAttributedString.Key.strikethroughStyle] = 1
            }else if item.lineMode == 2{
                ///下划线
                opts[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue
            }
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = item.lineSpacing
            opts[NSAttributedString.Key.paragraphStyle] = paragraphStyle
            
            let itemMus = NSMutableAttributedString(string: item.str, attributes: opts)
            mus.append(itemMus)
        }
        self.attributedText = mus
        return self
    }
}
