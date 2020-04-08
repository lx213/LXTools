//
//  Ex_UITextField.swift
//  LXTools
//
//  Created by 廖轩 on 2019/4/1.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation

private var key1: Void?
private var key2: Void?

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
        _ = UITextField()
        self.textAlignment = ali
        return self
    }
    
    ///设置默认文本
    public func msetPlaceholder(text: String) -> Self{
        self.placeholder = text
        return self
    }
    
    ///修改placeHolder字体颜色
    public func msetPlaceholderColor(text: String,color: UIColor) -> Self{
        let pstr = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : color])
        self.attributedPlaceholder = pstr
        return self
    }
    
    ///修改placeHolder字体颜色
    public func msetPlaceholderColor(text: String,color: Int) -> Self{
        let pstr = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: color)])
        self.attributedPlaceholder = pstr
        return self
    }
    
    ///修改placeHolder字体颜色
    public func msetPlaceholderColor(text: String,color: String) -> Self{
        let pstr = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor(hexString: color)])
        self.attributedPlaceholder = pstr
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
    
    /// 验证输入内容
    public func checkText(string: String) -> Bool {
        if string != "" {
            if let digits = self.digits {
                if digits != "" && !digits.contains(string) {
                    return false
                }
            }
            if let maxlength = self.maxlength {
                if (self.text?.characters.count)! >= maxlength {
                    return false
                }
            }
        }
        return true
    }
    
    /// 跳转到一下一个或收起键盘
    public func toNext(tfs: [UITextField]) {
        for (index,tf) in tfs.enumerated() {
            if tf == self {
                if index == tfs.count - 1 {
                    tf.resignFirstResponder()
                }else{
                    tfs[index+1].becomeFirstResponder()
                }
                return
            }
        }
    }
    
    /// 过滤空格
    public func getTrim() -> String {
        return self.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// 验证最终内容
    public func checkMsgFail(condition: Bool, errormsg: String ) -> Bool {
        if !condition {
            KrtAlertHelp.AlertShow(msg: errormsg)
            self.becomeFirstResponder()
        }
        return !condition
    }
    
    /// 内容限制
    @IBInspectable public var digits: String? {
        get {
            return objc_getAssociatedObject(self, &key1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key1, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 最大长度
    public var maxlength: Int? {
        get {
            return objc_getAssociatedObject(self, &key2) as? Int
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key2, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    //-------链式赋值------//
    /// 设置内容限制
    public func msetDigits(digits: String) -> Self{
        self.digits = digits
        return self
    }
    /// 设置最大长度
    public func msetMaxlength(maxlength: Int) -> Self {
        self.maxlength = maxlength
        return self
    }
    /// 设置delegate
    public func msetDelegate(delegate: UITextFieldDelegate) -> Self {
        self.delegate = delegate
        return self
    }
    /// 设置回车键类型
    public func msetReturnKeyType(keytype: UIReturnKeyType) -> Self {
        self.returnKeyType = keytype
        return self
    }
    /// 设置键盘类型
    public func msetKeyboardType(kbtype: UIKeyboardType) -> Self {
        self.keyboardType = kbtype
        return self
    }
}

public enum mDigits: String {
    case number = "0123456789"
    case xs = "0123456789."
    case letterlow = "qazwsxedcrfvtgbyhnujmikolp"
    case letterall = "qazwsxedcrfvtgbyhnujmikolpQAZWSXEDCRFVTGBYHNUJMIKOLP"
    case password = "0123456789qazwsxedcrfvtgbyhnujmikolpQAZWSXEDCRFVTGBYHNUJMIKOLP"
    case cardid = "0123456789xX"
    case email = "0123456789qazwsxedcrfvtgbyhnujmikolpQAZWSXEDCRFVTGBYHNUJMIKOLP@."
}
