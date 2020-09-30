//
//  Ex_UIScrollView.swift
//  LXTools
//
//  Created by 廖轩 on 2020/9/30.
//  Copyright © 2020 廖轩. All rights reserved.
//

import Foundation
extension UIScrollView {
    public func msetBehavior() -> Self {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
        }
        return self
    }
}
