//
//  MDatePickerView.swift
//  NCqybf
//
//  Created by 廖轩 on 2018/8/15.
//  Copyright © 2018年 余晓. All rights reserved.
//

import Foundation
@objc public protocol MDatePickerDelegate{
    //选择完整地址
    func picked(picker: MDatePickerView,time: Date)
}

open class MDatePickerView: UIView {
    
    var mwindow:UIWindow?
    var maskview: UIView?
    var picker = UIDatePicker()
    var btn = UIButton()
    weak var delegate:MDatePickerDelegate?
    var indexs = [0,0]
    var needinit = true
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    public convenience init(delegate:MDatePickerDelegate, mode: UIDatePickerMode){
        let frame = CGRect(x: 0, y: sh, width: sw, height: 250)
        self.init(frame: frame)
        
        self.delegate = delegate
        
        backgroundColor = UIColor.white
        maskview = UIView.init(frame: UIScreen.main.bounds)
        maskview?.backgroundColor = UIColor.clear
        maskview?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(viewhidden)))
        
        self.addSubview(picker)
        self.addSubview(btn)
        picker.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(200)
        }
        picker.datePickerMode = mode
        picker.locale = Locale(identifier: "zh_CN")
        
        btn.setTitle("确认", for: .normal)
        btn.setTitleColor(UIColor(hex: 0x29bafe), for: .normal)
        btn.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(50)
        }
        btn.addTarget(self, action: #selector(selectDate), for: .touchUpInside)
        
        let line = UIView()
        line.backgroundColor = UIColor(valueRGB: 0xf6f6f6)
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(btn)
            make.height.equalTo(1)
        }
    }
    
    //选择日期
    @objc func selectDate(){
        let stime = picker.date
        weak var wself = self
        delegate?.picked(picker: wself!, time: stime)
        viewhidden()
    }
    
    //展示弹窗
    public func show() {
        mwindow = UIWindow.init(frame: UIScreen.main.bounds)
        mwindow?.windowLevel = UIWindowLevelAlert + 1
        mwindow?.backgroundColor = UIColor.clear
        mwindow?.isHidden = true
        mwindow?.isUserInteractionEnabled = true
        mwindow?.addSubview(maskview!)
        mwindow?.addSubview(self)
        mwindow?.isHidden = false
        
        UIView.animate(withDuration: 0.2) {
            self.maskview?.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
            self.frame = CGRect(x: 0, y: sh - self.bounds.height, width: sw, height:self.bounds.height)
        }
    }
    
    //展示弹窗
    public func show(date: Date) {
        picker.setDate(date, animated: false)
        mwindow = UIWindow.init(frame: UIScreen.main.bounds)
        mwindow?.windowLevel = UIWindowLevelAlert + 1
        mwindow?.backgroundColor = UIColor.clear
        mwindow?.isHidden = true
        mwindow?.isUserInteractionEnabled = true
        mwindow?.addSubview(maskview!)
        mwindow?.addSubview(self)
        mwindow?.isHidden = false
        
        UIView.animate(withDuration: 0.2) {
            self.maskview?.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
            self.frame = CGRect(x: 0, y: sh - self.bounds.height, width: sw, height:self.bounds.height)
        }
    }
    
    //影藏弹窗
    @objc func viewhidden() {
        UIView.animate(withDuration: 0.2, animations: {
            self.maskview?.backgroundColor = UIColor.init(white: 0, alpha: 0)
            self.frame = CGRect(x:0, y:sh, width:sw, height:self.bounds.height)
        }) { (finished) in
            self.mwindow = nil
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
