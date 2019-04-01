//
//  BaseCodeTitleViewController.swift
//  iganzhou
//
//  Created by liao xuan on 17/8/28.
//  Copyright © 2017年 liao xuan. All rights reserved.
//

import UIKit
import SnapKit
open class BaseCodeTitleViewController: UIViewController,BaseTitleViewDelegate {

    public var btv = BaseTitleView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btv)
        btv.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(view)
            make.height.equalTo(getTH(vc: self))
        }
        btv.delegate = self
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override open func viewWillAppear(_ animated: Bool) {
        view.bringSubview(toFront: btv)
    }
    
    public func addTitleShadow(){
        addShadow(view: btv, y: getTH(vc: self))
    }
    
    open func back() {
        view.endEditing(true)
        if let navigationController = navigationController, navigationController.viewControllers.first != self {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    open func rightBtnAction() {
        print("rightAciton")
    }
    ///设置标题
    public func setBTitle(str:String) {
        btv.title = str
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
