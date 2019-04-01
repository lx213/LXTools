//
//  SetErrorView.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2018/2/24.
//  Copyright © 2018年 赣州科睿特软件. All rights reserved.
//

import Foundation
import SnapKit

public protocol SetErrorView {
    func setErrorView(pview: UIView, action: Selector, imgName: String)
    func hideErrorView(pview: UIView)
}

extension SetErrorView where Self: UIViewController {
    
    public func setErrorView(pview: UIView, action: Selector, imgName: String){
        hideErrorView(pview: pview)
        let v = UIView()
        v.backgroundColor = UIColor.white
        v.tag = 9012
        v.frame = CGRect(x: 0, y: 0, width: pview.frame.width, height: pview.frame.height)
        
        let img = UIImageView()
        let hintL = UILabel()
        let refreshBtn = UIButton()
        
        v.addSubview(hintL)
        v.addSubview(refreshBtn)
        v.addSubview(img)
        
        hintL.text = "当前网络环境差请重新加载~"
        hintL.textColor = UIColor(valueRGB: 0x999999)
        hintL.sizeToFit()
        hintL.snp.makeConstraints { (make) in
            make.center.equalTo(v)
            make.width.equalTo(hintL.zj_width)
            make.height.equalTo(hintL.zj_height)
        }
        
        img.image = UIImage(named: imgName)
        img.sizeToFit()
        img.snp.makeConstraints { (make) in
            make.centerX.equalTo(v)
            make.height.equalTo(img.zj_height)
            make.width.equalTo(img.zj_width)
            make.bottom.equalTo(hintL.snp.top).offset(-16)
        }
        
        refreshBtn.setTitle("重新加载", for: .normal)
        refreshBtn.setTitleColor(UIColor.black, for: .normal)
        refreshBtn.sizeToFit()
        refreshBtn.layer.cornerRadius = 15
        refreshBtn.clipsToBounds = true
//        refreshBtn.setTitleColor(UIColor.white, for: .normal)
        refreshBtn.backgroundColor = UIColor.white
        refreshBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(v)
            make.width.equalTo(120)
            make.height.equalTo(30)
            make.top.equalTo(hintL.snp.bottom).offset(40)
        }
        refreshBtn.addTarget(self, action: action, for: .touchUpInside)
        
        pview.addSubview(v)
        
    }
    
    public func hideErrorView(pview: UIView){
        pview.subviews.filter({ $0.tag == 9012 }).first?.removeFromSuperview()
    }
}
