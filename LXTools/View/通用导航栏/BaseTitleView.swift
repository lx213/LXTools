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
    func close()
}

@IBDesignable open class BaseTitleView: UIView {
    
    @IBInspectable public var backgColor: UIColor? = UIColor.white
    @IBInspectable public var leftBtnW:CGFloat = 50
    @IBInspectable public var leftBtnH:CGFloat = 70
    @IBInspectable public var rightBtnW:CGFloat = 50
    @IBInspectable public var rightBtnH:CGFloat = 70
    @IBInspectable public var titleFont:CGFloat = 18
    @IBInspectable public var title:String = "标题"
    @IBInspectable public var rightTit:String?
    @IBInspectable public var rightImg:UIImage?
    @IBInspectable public var rightFont:CGFloat = 14
    @IBInspectable public var hintColor:UIColor = UIColor.black
    @IBInspectable public var canBack:Bool = true
    @IBInspectable public var rightBtnHidden = false
    @IBInspectable public var canClose:Bool = false
    
    public weak var delegate:BaseTitleViewDelegate?

    public var leftBtn:UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "back"), for: .normal)
        b.contentHorizontalAlignment = .left
        b.sizeToFit()
        return b
    }()
    public var closeBtn:UIButton = {
        let c = UIButton()
        c.setImage(UIImage(named:"v21p78_01"), for: .normal)
        c.contentHorizontalAlignment = .left
        c.sizeToFit()
        return c
    }()
    public var titleLab:UILabel = {
        let l = UILabel()
        l.textColor = UIColor.white
        l.textAlignment = .center
        return l
    }()
    public var rightBtn = UIButton()
    public var backView = UIView()
    
    
    public var myButton: UIButton!
    
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
        self.addSubview(closeBtn)
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
            make.width.equalTo(leftBtnW)
            make.height.equalTo(backView)
        }
        leftBtn.imageView?.contentMode = .scaleAspectFit
        leftBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        closeBtn.sizeToFit()
        closeBtn.snp.makeConstraints { (make) in
            make.left.equalTo(leftBtn.snp.right).offset(16.tompx())
            make.centerY.equalTo(leftBtn)
            make.width.equalTo(50)
            make.height.equalTo(closeBtn.frame.size.height + 20)
        }
        closeBtn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        rightBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-16)
            make.centerY.equalTo(titleLab)
            make.width.equalTo(rightBtnW)
            make.height.equalTo(rightBtnH)
        }
        rightBtn.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
    }
    
    @objc func backAction() {
        delegate?.back()
    }
    
    @objc func closeAction(){
        delegate?.close()
    }
    
    @objc func rightAction() {
        delegate?.rightBtnAction()
    }
    
    public func setBackBtnATint(color: UIColor) {
        leftBtn.setImage(leftBtn.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
        leftBtn.tintColor = color
    }
    
    override open func layoutSubviews() {
        // refresh button state through attribute inspector
        backView.backgroundColor = backgColor
        leftBtn.isHidden = !canBack
        closeBtn.isHidden = !canClose
        titleLab.font = UIFont.systemFont(ofSize: titleFont)
        titleLab.text = title
        titleLab.textColor = hintColor
        titleLab.frame.size.height = UIFont.systemFont(ofSize: titleFont).lineHeight
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: rightFont)
        rightBtn.setTitle(rightTit, for: .normal)
        rightBtn.setTitleColor(hintColor, for: .normal)
        rightBtn.setImage(rightImg, for: .normal)
//        rightBtn.sizeToFit()
        rightBtn.isHidden = rightBtnHidden
    }
}
