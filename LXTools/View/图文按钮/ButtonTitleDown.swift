//
//  ButtonTitleDown.swift
//  zhhc
//
//  Created by liao xuan on 17/6/13.
//  Copyright © 2017年 liao xuan. All rights reserved.
//

import UIKit

open class ButtonTitleDown: UIButton {

    override open func layoutSubviews() {
        super.layoutSubviews()
        
        /// 外边距
        let margin: CGFloat = 5
        let height = frame.size.height
        let width = frame.size.width
        
        let imgH = imageView!.frame.size.height
        let imgW = imageView!.frame.size.width
        let titH = titleLabel!.frame.size.height
        _ = titleLabel!.frame.size.width
        /// 最终上下外边距
        let contentMargin = (height - imgH - titH - margin) / 2
        
        /// 居中放置控件
        imageView!.frame.origin.y = contentMargin
        imageView!.frame.origin.x = (width - imgW) / 2
        titleLabel!.frame.origin.y = imageView!.frame.maxY + margin
        titleLabel!.frame.origin.x = 0
        titleLabel?.frame.size.width = width
//        titleLabel?.backgroundColor = UIColor.orangeColor()
        titleLabel?.textAlignment = .center
    }
}
