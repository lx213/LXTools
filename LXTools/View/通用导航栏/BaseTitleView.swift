//
//  BaseTitleView.swift
//  iganzhou
//
//  Created by liao xuan on 17/8/26.
//  Copyright © 2017年 liao xuan. All rights reserved.
//

import UIKit
import SnapKit
@objc public protocol BaseTitleViewDelegate {
    func back()
    func rightBtnAction()
}

@IBDesignable open class BaseTitleView: UIView {
    
    @IBInspectable var backgColor: UIColor? = UIColor.white
    @IBInspectable var titleFont:CGFloat = 18
    @IBInspectable var title:String = "标题"
    @IBInspectable var rightTit:String?
    @IBInspectable var rightImg:UIImage?
    @IBInspectable var rightFont:CGFloat = 14
    @IBInspectable var hintColor:UIColor = UIColor.black
    @IBInspectable var canBack:Bool = true
    @IBInspectable var rightBtnHidden = false
    
    weak var delegate:BaseTitleViewDelegate?

    var leftBtn:UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "back"), for: .normal)
        b.contentHorizontalAlignment = .left
        b.sizeToFit()
        return b
    }()
    var titleLab:UILabel = {
        let l = UILabel()
        l.textColor = UIColor.white
        l.textAlignment = .center
        return l
    }()
    var rightBtn = UIButton()
    var backView = UIView()
    
    
    var myButton: UIButton!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initView()
    }
    
    func initView() {
        self.addSubview(backView)
        self.addSubview(titleLab)
        self.addSubview(leftBtn)
        self.addSubview(rightBtn)
        backView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        titleLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(UIScreen.main.bounds.size.width-160)
            make.centerY.equalTo(self).offset(getSbarH()/2)
        }
        leftBtn.sizeToFit()
        leftBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(16)
            make.centerY.equalTo(titleLab)
            make.width.equalTo(50)
            make.height.equalTo(leftBtn.frame.size.height + 20)
        }
        leftBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        rightBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-16)
            make.centerY.equalTo(titleLab)
        }
        rightBtn.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
    }
    
    @objc func backAction() {
        delegate?.back()
    }
    
    @objc func rightAction() {
        delegate?.rightBtnAction()
    }
    
    override open func layoutSubviews() {
        // refresh button state through attribute inspector
        backView.backgroundColor = backgColor
        leftBtn.isHidden = !canBack
        titleLab.font = UIFont.systemFont(ofSize: titleFont)
        titleLab.text = title
        titleLab.textColor = hintColor
        titleLab.frame.size.height = UIFont.systemFont(ofSize: titleFont).lineHeight
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: rightFont)
        rightBtn.setTitle(rightTit, for: .normal)
        rightBtn.setTitleColor(hintColor, for: .normal)
        rightBtn.setImage(rightImg, for: .normal)
        rightBtn.sizeToFit()
        rightBtn.isHidden = rightBtnHidden
    }
}
