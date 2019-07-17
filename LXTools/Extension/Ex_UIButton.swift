//
//  Ex_UIButton.swift
//  LXTools
//
//  Created by 廖轩 on 2019/4/1.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation

extension UIButton {
    ///设置文本内容
    public func msetText(text: String, state: UIControlState) -> Self {
        self.setTitle(text, for: state)
        return self
    }
    
    ///设置图片
    public func msetImg(img: UIImage?, state: UIControlState) -> Self {
        self.setImage(img, for: state)
        return self
    }
    
    ///设置图片
    public func msetBackgroundImage(img: UIImage?, state: UIControlState) -> Self {
        self.setBackgroundImage(img, for: state)
        return self
    }
    
    ///设置字体大小
    public func msetFont(size: CGFloat) -> Self {
        self.titleLabel?.font = UIFont.systemFont(ofSize: size)
        return self
    }
    
    ///设置粗体字
    public func msetBFont(size: CGFloat) -> Self {
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: size)
        return self
    }
    
    ///设置字体颜色
    public func msetTextColor(color: UIColor?, state: UIControlState) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    ///设置字体颜色
    public func msetTextColor(color: Int, state: UIControlState) -> Self {
        self.setTitleColor(UIColor(hex: color), for: state)
        return self
    }
    
    ///设置字体颜色
    public func msetTextColor(color: String, state: UIControlState) -> Self {
        self.setTitleColor(UIColor(hexString: color), for: state)
        return self
    }
    
    ///设置选中
    public func msetSelected(selected: Bool) -> Self {
        self.isSelected = selected
        return self
    }
    
    ///设置点击事件
    public func msetClick(target: Any?, action: Selector, event: UIControlEvents = UIControlEvents.touchUpInside) -> Self {
        let a = UIButton()
        self.addTarget(target, action: action, for: event)
        return self
    }
    
    ///设置水平对齐方式
    public func msetHAlignment(ali: UIControlContentHorizontalAlignment, imginsets: UIEdgeInsets = UIEdgeInsets.zero, contentinsets: UIEdgeInsets = UIEdgeInsets.zero) -> Self {
        self.contentHorizontalAlignment = ali
        self.imageEdgeInsets = imginsets
        self.contentEdgeInsets = contentinsets
        return self
    }
}
