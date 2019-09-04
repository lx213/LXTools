//
//  PTextView.swift
//  NCqybf
//
//  Created by 廖轩 on 2018/10/8.
//  Copyright © 2018年 . All rights reserved.
//

import Foundation

open class PTextView: UIView,UITextViewDelegate {
    
    var tv = UITextView()
    var ptv = UITextView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        ptv.textColor = UIColor(hex: 0xc0c0c0)
        ptv.msetBackColor(color: UIColor.clear).maddToView(view: self).snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        tv.msetBackColor(color: UIColor.clear).maddToView(view: self).snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        ptv.delegate = self
        tv.delegate = self
    }
    
    public func setPlaceHolder(str: String) -> Self {
        ptv.text = str
        return self
    }
    
    public func setFont(font: CGFloat) -> Self {
        ptv.font = UIFont.systemFont(ofSize: font)
        tv.font = UIFont.systemFont(ofSize: font)
        return self
    }
    
    public func getText() -> String {
        return tv.text
    }
    
    public func setText(str: String) -> Self {
        tv.text = str
        ptv.isHidden = true
        return self
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        if textView == tv {
            ptv.isHidden = tv.text != ""
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
