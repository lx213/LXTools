//
//  Ex_UIWebview.swift
//  LXTools
//
//  Created by 廖轩 on 2020/9/30.
//  Copyright © 2020 廖轩. All rights reserved.
//

import Foundation
extension UIWebView {
    public func mclearBg() -> Self {
        self.isOpaque = false
        self.backgroundColor = UIColor.clear
        return self
    }
}
