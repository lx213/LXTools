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
    public func msetText(text: String, state: UIControl.State) -> Self {
        self.setTitle(text, for: state)
        return self
    }
    
    ///设置图片
    public func msetImg(img: UIImage?, state: UIControl.State) -> Self {
        self.setImage(img, for: state)
        return self
    }
    
    ///设置图片
    public func msetImg(img: String, state: UIControl.State) -> Self {
        self.setImage(UIImage(named: img), for: state)
        return self
    }
    
    ///设置图片
    public func msetBackgroundImage(img: UIImage?, state: UIControl.State) -> Self {
        self.setBackgroundImage(img, for: state)
        return self
    }
    
    ///设置图片
    public func msetBackgroundImage(img: String, state: UIControl.State) -> Self {
        self.setBackgroundImage(UIImage(named: img), for: state)
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
    public func msetTextColor(color: UIColor?, state: UIControl.State) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    ///设置字体颜色
    public func msetTextColor(color: Int, state: UIControl.State) -> Self {
        self.setTitleColor(UIColor(hex: color), for: state)
        return self
    }
    
    ///设置字体颜色
    public func msetTextColor(color: String, state: UIControl.State) -> Self {
        self.setTitleColor(UIColor(hexString: color), for: state)
        return self
    }
    
    ///设置选中
    public func msetSelected(selected: Bool) -> Self {
        self.isSelected = selected
        return self
    }
    
    ///设置点击事件
    public func msetClick(target: Any?, action: Selector, event: UIControl.Event = UIControl.Event.touchUpInside) -> Self {
        _ = UIButton()
        self.addTarget(target, action: action, for: event)
        return self
    }
    
    ///设置水平对齐方式
    public func msetHAlignment(ali: UIControl.ContentHorizontalAlignment, imginsets: UIEdgeInsets = UIEdgeInsets.zero, contentinsets: UIEdgeInsets = UIEdgeInsets.zero) -> Self {
        self.contentHorizontalAlignment = ali
        self.imageEdgeInsets = imginsets
        self.contentEdgeInsets = contentinsets
        return self
    }
    
    ///设置图片边距
    public func msetImgInset(inset: UIEdgeInsets) -> Self{
        self.imageEdgeInsets = inset
        return self
    }
    
    ///设置文本边距
    public func msetTextInset(inset: UIEdgeInsets) -> Self{
        self.titleEdgeInsets = inset
        return self
    }
}
