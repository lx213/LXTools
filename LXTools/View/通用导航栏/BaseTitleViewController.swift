//
//  BaseTitleViewController.swift
//  zhyc
//
//  Created by liao xuan on 17/8/9.
//  Copyright © 2017年 liao xuan. All rights reserved.
//

import UIKit

open class BaseTitleViewController: UIViewController,BaseTitleViewDelegate {
    
    public func close() {
        view.endEditing(true)
        self.VCBack()
    }

    @IBOutlet public weak var btv: BaseTitleView!
    override open func viewDidLoad() {
        super.viewDidLoad()
        btv.delegate = self
    }

    override open func viewWillAppear(_ animated: Bool) {
        self.TopBarHidden(bool: true, isstory: true)
    }
    ///添加阴影
    public func addTitleShadow(){
        addShadow(view: btv, y: btv.zj_height)
        view.bringSubviewToFront(btv)
    }
    
    open func back() {
        view.endEditing(true)
        VCBack()
    }
    
    open func rightBtnAction() {
        
    }
    ///设置标题
    public func setBTitle(str:String?) {
        btv.title = str == nil ? "" : str!
    }
    ///隐藏右侧按钮
    public func hiddenRightBtn(hidden:Bool) {
        btv.rightBtnHidden = hidden
    }
    ///设置右侧按钮标题
    public func setBRightTit(str:String) {
        btv.rightTit = str
    }
    ///设置右侧按钮图片
    public func setBRightImg(img:UIImage?) {
        btv.rightImg = img
    }
}
