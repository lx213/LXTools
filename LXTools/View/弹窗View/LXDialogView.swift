//
//  LXDialogView.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2019/8/28.
//  Copyright © 2019 赣州科睿特软件. All rights reserved.
//

import UIKit
import Spring

public enum LXDialogShowMode {
    case fade
    case bottom
    case custom
}

open class LXDialogView: SpringImageView {

    public var mwindow:UIWindow?
    public var maskview: UIView?
    public var showMode = LXDialogShowMode.fade
    public var maskAlpha:CGFloat = 0.3
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        maskview = UIView.init(frame: UIScreen.main.bounds)
        maskview?.backgroundColor = UIColor.clear
        maskview?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(viewhidden)))
    }
    
    //展示弹窗
    public func show() {
        mwindow = UIWindow.init(frame: UIScreen.main.bounds)
        mwindow?.windowLevel = UIWindowLevelAlert + 1
        mwindow?.backgroundColor = UIColor.clear
        mwindow?.isHidden = true
        mwindow?.isUserInteractionEnabled = true
        mwindow?.addSubview(maskview!)
        mwindow?.addSubview(self)
        mwindow?.isHidden = false
        
        UIView.animate(withDuration: 0.2) {
            self.maskview?.backgroundColor = UIColor.init(white: 0, alpha: self.maskAlpha)
        }
        switch showMode {
        case .fade:
            self.animation = Spring.AnimationPreset.FadeIn.rawValue
            self.animate()
        case .bottom:
            self.animation = Spring.AnimationPreset.FadeInUp.rawValue
            self.animate()
        default:
            ()
        }
    }
    
    //影藏弹窗
    @objc public func viewhidden() {
        switch showMode {
        case .custom:
            ()
        default:
            self.animation = Spring.AnimationPreset.FadeOut.rawValue
            self.animate()
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.maskview?.backgroundColor = UIColor.init(white: 0, alpha: 0)
        }) { (finished) in
            self.mwindow = nil
        }
    }
    
    public static func centerFrame(width:CGFloat,height:CGFloat) -> CGRect {
        return CGRect(x: (sw - width)/2, y: (sh - height)/2, width: width, height: height)
    }
    
    public static func bottomFrame(width:CGFloat,height:CGFloat) -> CGRect {
        return CGRect(x: (sw - width)/2, y: sh - height, width: width, height: height)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
