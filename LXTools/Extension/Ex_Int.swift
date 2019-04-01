//
//  Ex_Int.swift
//  LXTools
//
//  Created by 廖轩 on 2019/4/1.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation
extension Int {
    public func tompx() -> CGFloat {
        let m = CGFloat(self) * mpx
        return m
    }
}
