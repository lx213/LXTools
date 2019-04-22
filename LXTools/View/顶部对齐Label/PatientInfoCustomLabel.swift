//
//  PatientInfoCustomLabel.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2019/1/8.
//  Copyright © 2019 赣州科睿特软件. All rights reserved.
//

import Foundation

open class PatientInfoCustomLabel: UILabel {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        textRect.origin.y = bounds.origin.y
        return textRect
    }
    
    override open func drawText(in rect: CGRect) {
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: actualRect)
    }
    
}
