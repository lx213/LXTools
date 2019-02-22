//
//  UIViewEx.swift
//  iganzhou
//
//  Created by 廖轩 on 2018/7/31.
//  Copyright © 2018年 liao xuan. All rights reserved.
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
    
    ///设置字体颜色
    public func msetTextColor(color: UIColor?) -> Self {
        self.textColor = color
        return self
    }
    
    ///设置文本对齐
    public func msetTextAlignment(ali: NSTextAlignment) -> Self {
        self.textAlignment = ali
        return self
    }
    
    ///设置行数
    public func msetLineNumber(num: Int) -> Self {
        let a = UILabel()
        self.numberOfLines = num
        return self
    }
    
}

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

extension UIImageView {
    ///设置图片
    public func msetImg(img: UIImage) -> Self{
        self.image = img
        return self
    }
    ///设置图片
    public func msetImg(imgName: String) -> Self{
        self.image = UIImage(named: imgName)
        return self
    }
    ///设置缩放方式
    public func msetContentMode(mode: ContentMode) -> Self{
        self.contentMode = mode
        return self
    }
}

extension UITextField {
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
    
    ///设置字体颜色
    public func msetTextColor(color: UIColor?) -> Self {
        self.textColor = color
        return self
    }
    
    ///设置文本对齐
    public func msetTextAlignment(ali: NSTextAlignment) -> Self {
        let a = UITextField()
        self.textAlignment = ali
        return self
    }
    
    ///设置默认文本
    public func msetPlaceholder(text: String) -> Self{
        self.placeholder = text
        return self
    }
    
    ///修改placeHolder字体颜色
    public func msetPlaceholderColor(color: UIColor) -> Self{
        self.setValue(color, forKeyPath: "_placeholderLabel.textColor")
        return self
    }
    
    ///设置密码隐藏
    public func msetSecureTextEntry(hidden: Bool) -> Self {
        self.isSecureTextEntry = hidden
        return self
    }
    
    ///设置清除按钮显示模式
    public func msetClearButton(mode: ViewMode) -> Self{
        self.clearButtonMode = mode
        return self
    }
    
    ///输入框类型
    public enum tfType {
        case none //无限制
        case phone //手机
        case password  //密码
        case cardid  //身份证
        case email  //邮箱
        case yzm  //验证码
    }
    
    ///设置输入框类型
    public func msetInputType(type: tfType, delegate: UITextFieldDelegate, isEnd: Bool = false) -> Self{
        switch type {
        case .phone:
            self.msetDigits(digits: mDigits.number.rawValue).msetMaxlength(maxlength: 11).msetKeyboardType(kbtype: .namePhonePad)
        case .password:
            self.msetMaxlength(maxlength: 32).msetDigits(digits: mDigits.password.rawValue).msetSecureTextEntry(hidden: true)
        case .cardid:
            self.msetDigits(digits: mDigits.cardid.rawValue).msetMaxlength(maxlength: 18)
        case .email:
            self.msetDigits(digits: mDigits.email.rawValue)
        case .yzm:
            self.msetDigits(digits: mDigits.number.rawValue).msetMaxlength(maxlength: 6).msetKeyboardType(kbtype: .numberPad)
        case .none:
            ()
        }
        self.msetDelegate(delegate: delegate).msetClearButton(mode: .whileEditing).msetReturnKeyType(keytype: isEnd ? .done : .next)
        return self
    }
}

extension UIView {
    ///设置背景颜色
    public func msetBackColor(color: UIColor?) -> Self {
        self.backgroundColor = color
        return self
    }
    
    ///设置边框
    public func msetBorder(color: UIColor?, width: CGFloat) -> Self {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    ///设置圆角
    public func msetCornerRadius(radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        return self
    }
    
    ///设置阴影
    public func msetShadow(color: UIColor) -> Self {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        return self
    }
    
    ///添加至view
    public func maddToView(view: UIView) -> Self {
        view.addSubview(self)
        return self
    }
}
