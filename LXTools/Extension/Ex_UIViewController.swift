//
//  AllExtension.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2017/10/20.
//  Copyright © 2017年 廖轩. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    ///push到下一页
    public func pushToView(vc: UIViewController, ani: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: ani)
    }
    
    ///push返回上一页
    public func pushBack(ani: Bool = true) {
        self.navigationController?.popViewController(animated: ani)
    }
    
    ///present到下一页
    public func presentToView(vc: UIViewController, ani: Bool = true, completion: (() -> Void)? = nil) {
        self.present(vc, animated: ani, completion: completion)
    }
    
    ///present返回上一页
    public func presentBack(ani: Bool = true, completion: (() -> Void)? = nil) {
        self.dismiss(animated: ani, completion: completion)
    }
}
