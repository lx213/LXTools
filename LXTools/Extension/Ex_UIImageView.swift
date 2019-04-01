//
//  Ex_UIImageView.swift
//  LXTools
//
//  Created by 廖轩 on 2019/4/1.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation
import YYWebImage

extension UIImageView {
    ///设置图片
    public func msetImg(img: UIImage) -> Self{
        self.image = img
        return self
    }
    ///设置图片
    public func msetImg(imgName: String) -> Self{
        self.image = UIImage(named: imgName)
        return self
    }
    ///设置缩放方式
    public func msetContentMode(mode: ContentMode) -> Self{
        self.contentMode = mode
        return self
    }
    
    /// 创建标注类型图片
    public convenience init(pointImgUrl: String) {
        self.init()
        frame = CGRect(x: 4, y: 4, width: 22, height: 20)
        contentMode = .scaleAspectFit
        self.yy_setImage(with: URL(string: pointImgUrl), placeholder: UIImage())
    }
    
    /// 创建标注类型图片
    public convenience init(RoundpointImgUrl: String) {
        self.init()
        frame = CGRect(x: 4, y: 4, width: 20, height: 20)
        contentMode = .scaleAspectFit
        self.yy_setImage(with: URL(string: RoundpointImgUrl), placeholder: UIImage())
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    /// 创建标注类型图片
    public convenience init(pointImgName: String) {
        self.init()
        frame = CGRect(x: 4, y: 4, width: 22, height: 20)
        contentMode = .scaleAspectFit
        image = UIImage(named: pointImgName)
    }
    
    /// 创建标注底图
    public convenience init(pointBackImg: Int) {
        self.init()
        frame = CGRect(x: 0, y: 0, width: 30, height: 42)
        contentMode = .scaleAspectFit
        image = UIImage(named: "norpoint")
    }
}
