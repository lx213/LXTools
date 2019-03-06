//
//  MCollectionViewCell.swift
//  test
//
//  Created by liao xuan on 16/12/13.
//  Copyright © 2016年 liao xuan. All rights reserved.
//

import UIKit

open class MCollectionViewCell: UICollectionViewCell {

    var img = UIImageView()
    var title =  UILabel()
    override public init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.white
        title.textColor = UIColor(valueRGB: 0x6F7179)
        title.font = UIFont.systemFont(ofSize: 13)
        title.textAlignment = .center
        
        self.contentView.addSubview(img)
        self.contentView.addSubview(title)
        img.snp.makeConstraints { (make) in
            make.width.height.equalTo(104.tompx())
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView).offset(-10)
        }
        
        title.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentView)
            make.height.equalTo(title.font.lineHeight)
            make.top.equalTo(img.snp.bottom).offset(4)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
