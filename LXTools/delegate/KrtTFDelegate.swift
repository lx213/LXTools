//
//  KrtTFDelegate.swift
//  NCqybf
//
//  Created by 廖轩 on 2018/12/10.
//  Copyright © 2018 余晓. All rights reserved.
//

import Foundation

open class KrtTFDelegate: NSObject,UITextFieldDelegate {
    
    var tfs = [UITextField]()
    
    init(tfs: [UITextField]) {
        super.init()
        self.tfs = tfs
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.toNext(tfs: tfs)
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.checkText(string: string)
    }
}
