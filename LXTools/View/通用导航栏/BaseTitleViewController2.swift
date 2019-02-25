//
//  BaseTitleViewController2.swift
//  NCqybf
//
//  Created by 廖轩 on 2018/10/10.
//  Copyright © 2018年 余晓. All rights reserved.
//

import Foundation

open class BaseTitleViewController2: UIViewController,BaseTitleViewDelegate {
    
    @IBOutlet weak var btv: BaseTitleView!
    override open func viewDidLoad() {
        super.viewDidLoad()
        btv.delegate = self
        btv.titleLab.snp.updateConstraints { (make) in
            make.centerY.equalTo(btv).offset(0)
        }
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        TopBarHidden(bool: true, v: self)
        view.bringSubview(toFront: btv)
    }
    
    public func addTitleShadow(){
        addShadow(view: btv, y: btv.zj_height)
    }
    
    public func back() {
        view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    
    public func rightBtnAction() {
        
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
