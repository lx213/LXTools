//
//  SetNoDataView.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2018/2/24.
//  Copyright © 2018年 赣州科睿特软件. All rights reserved.
//

import Foundation

public protocol SetNoDataView {
    func setNoDataView(pview: UIView)
    func hideNoDataView(pview: UIView)
}

extension SetNoDataView where Self: UIViewController {
    
    
    func setNoDataView(pview: UIView, imgName: String){
        hideNoDataView(pview: pview)
        let img = UIImageView()
        img.image = UIImage(named: imgName)
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.removeFromSuperview()
        img.tag = 9011
        img.frame = CGRect(x: 0, y: 0, width: pview.frame.width, height: pview.frame.height)
        pview.addSubview(img)
        
    }
    
    func hideNoDataView(pview: UIView){
        pview.subviews.filter({ $0.tag == 9011 }).first?.removeFromSuperview()
    }
}
