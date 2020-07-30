//
//  CountDownButton.swift
//  NCqybf
//
//  Created by 廖轩 on 2018/11/1.
//  Copyright © 2018年 余晓. All rights reserved.
//

import UIKit

open class CountDownButton: UIButton {

    var maxTime = 60
    /// 验证码倒计时
    var timelimit = 60
    /// 计时器
    var timer:Timer!
    var normalText = "获取验证码"
    var cdText = "秒后重新获取"
    
    //倒计时
    @objc func countDown() {
        timelimit -= 1
        if timelimit == 0 {
            stopCountDown()
        }else{
            self.setTitle("\(timelimit)\(cdText)", for: .normal)
        }
    }
    
    public init(maxTime: Int, normalText: String = "获取验证码", cdText: String = "秒后重新获取") {
        super.init(frame: CGRect.zero)
        self.maxTime = maxTime
        self.timelimit = maxTime
        self.normalText = normalText
        self.cdText = cdText
        self.msetText(text: normalText, state: .normal)
    }
    
    //开始倒计时
    public func startCountDown() {
        self.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
    }
    
    //结束倒计时
    public func stopCountDown() {
        self.isEnabled = true
        timer.invalidate()
        self.setTitle(normalText, for: .normal)
        timelimit = maxTime
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
