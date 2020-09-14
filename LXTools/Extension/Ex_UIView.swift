//
//  Ex_UIView.swift
//  LXTools
//
//  Created by 廖轩 on 2019/4/1.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation
import SnapKit

private var key: Void?

extension UIView {
    ///设置背景颜色
    public func msetBackColor(color: UIColor?) -> Self {
        self.backgroundColor = color
        return self
    }
    
    ///设置背景颜色
    public func msetBackColor(color: Int) -> Self {
        self.backgroundColor = UIColor(hex: color)
        return self
    }
    
    ///设置背景颜色
    public func msetBackColor(color: String) -> Self {
        self.backgroundColor = UIColor(hexString: color)
        return self
    }
    
    ///设置边框
    public func msetBorder(color: UIColor?, width: CGFloat) -> Self {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    ///设置边框
    public func msetBorder(color: Int, width: CGFloat) -> Self {
        self.layer.borderColor = UIColor(hex: color)?.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    ///设置边框
    public func msetBorder(color: String, width: CGFloat) -> Self {
        self.layer.borderColor = UIColor(hexString: color)?.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    ///设置圆角
    public func msetCornerRadius(radius: CGFloat,needClip: Bool = true) -> Self {
        self.layer.cornerRadius = radius
        self.clipsToBounds = needClip
        return self
    }
    
    ///设置阴影
    public func msetShadow(color: UIColor) -> Self {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        return self
    }
    
    ///设置阴影
    public func msetShadow(color: Int) -> Self {
        self.layer.shadowColor = UIColor(hex: color)?.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        return self
    }
    
    ///设置阴影
    public func msetShadow(color: String) -> Self {
        self.layer.shadowColor = UIColor(hexString: color)?.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        return self
    }
    
    ///添加至view
    public func maddToView(view: UIView) -> Self {
        view.addSubview(self)
        return self
    }
    
    ///添加至view
    public func minsertToView(view: UIView, at: Int) -> Self {
        view.insertSubview(self, at: at)
        return self
    }
    
    ///获取所在的viewController
    public var getCurrentVC: UIViewController? {
        var next = superview
        while (next != nil) {
            let nextResponder = next?.next
            if (nextResponder is UIViewController) {
                return nextResponder as? UIViewController
            }
            next = next?.superview
        }
        return nil
    }
    
    ///设置隐藏
    public func msetHidden(hidden: Bool) -> Self {
        self.isHidden = hidden
        return self
    }
    
    ///设置tag
    public func msetTag(tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    ///旋转
    public func rotate360DegreeWithImageView(duration:CFTimeInterval , repeatCount :Float ) {
        
        //让其在z轴旋转
        let rotationAnimation  = CABasicAnimation(keyPath: "transform.rotation.z")
        
        //旋转角度
        rotationAnimation.toValue = NSNumber(value:  Double.pi * 2.0 )
        
        //旋转周期
        rotationAnimation.duration = duration;
        
        //旋转累加角度
        rotationAnimation.isCumulative = true;
        
        //旋转次数
        rotationAnimation.repeatCount = repeatCount;
        
        self.layer .add(rotationAnimation, forKey: "rotationAnimation")
        
    }
    //停止旋转
    public func stopRotate() {
        
        self.layer.removeAllAnimations()
    }
    
    
    //添加点击事件
    public func addOnClickListener(target: AnyObject, action: Selector) {
        let gr = UITapGestureRecognizer(target: target, action: action)
        isUserInteractionEnabled = true
        addGestureRecognizer(gr)
    }
    
    ///存储内容
    @IBInspectable public var keyName: AnyObject? {
        get {
            return objc_getAssociatedObject(self, &key) as AnyObject
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    ///旋转view
    public func rotate(toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
        
    }
    
    /// x
    public var zj_x: CGFloat {
        set(x) {
            frame.origin.x = x
        }
        
        get {
            return frame.origin.x
        }
    }
    /// y
    public var zj_y:CGFloat {
        set(y) {
            frame.origin.y = y
        }
        
        get {
            return frame.origin.y
        }
    }
    /// centerX
    public var zj_centerX: CGFloat {
        set(centerX) {
            center.x = centerX
        }
        
        get {
            return center.x
        }
    }
    /// centerY
    public var zj_centerY: CGFloat {
        set(centerY) {
            center.y = centerY
        }
        
        get {
            return center.y
        }
    }
    /// width
    public var zj_width: CGFloat {
        set(width) {
            frame.size.width = width
        }
        
        get {
            return bounds.size.width
        }
    }
    /// height
    public var zj_height: CGFloat {
        set(height) {
            frame.size.height = height
        }
        
        get {
            return bounds.size.height
        }
    }

    ///设置约束
    public func msetSnp(tips: [snpTip]) -> Self {
        self.snp.makeConstraints { (make) in
            for tip in tips {
                for extend in tip.extend {
                    switch extend {
                    case .left:
                        make.left.equalTo(tip.target).offset(tip.offset)
                    case .top:
                        make.top.equalTo(tip.target).offset(tip.offset)
                    case .bottom:
                        make.bottom.equalTo(tip.target).offset(tip.offset)
                    case .right:
                        make.right.equalTo(tip.target).offset(tip.offset)
                    case .width:
                        make.width.equalTo(tip.target).offset(tip.offset)
                    case .height:
                        make.height.equalTo(tip.target).offset(tip.offset)
                    case .centerX:
                        make.centerX.equalTo(tip.target).offset(tip.offset)
                    case .centerY:
                        make.centerY.equalTo(tip.target).offset(tip.offset)
                    case .edges:
                        make.edges.equalTo(tip.target).offset(tip.offset)
                    case .center:
                        make.center.equalTo(tip.target).offset(tip.offset)
                    }
                }
            }
        }
        return self
    }
    
    ///更新约束
    public func mupSnp(tips: [snpTip]) -> Self {
        self.snp.updateConstraints { (make) in
            for tip in tips {
                for extend in tip.extend {
                    switch extend {
                    case .left:
                        make.left.equalTo(tip.target).offset(tip.offset)
                    case .top:
                        make.top.equalTo(tip.target).offset(tip.offset)
                    case .bottom:
                        make.bottom.equalTo(tip.target).offset(tip.offset)
                    case .right:
                        make.right.equalTo(tip.target).offset(tip.offset)
                    case .width:
                        make.width.equalTo(tip.target).offset(tip.offset)
                    case .height:
                        make.height.equalTo(tip.target).offset(tip.offset)
                    case .centerX:
                        make.centerX.equalTo(tip.target).offset(tip.offset)
                    case .centerY:
                        make.centerY.equalTo(tip.target).offset(tip.offset)
                    case .edges:
                        make.edges.equalTo(tip.target).offset(tip.offset)
                    case .center:
                        make.center.equalTo(tip.target).offset(tip.offset)
                    }
                }
            }
        }
        return self
    }
    
    ///重置约束
    public func mrsetSnp(tips: [snpTip]) -> Self {
        self.snp.remakeConstraints{ (make) in
            for tip in tips {
                for extend in tip.extend {
                    switch extend {
                    case .left:
                        make.left.equalTo(tip.target).offset(tip.offset)
                    case .top:
                        make.top.equalTo(tip.target).offset(tip.offset)
                    case .bottom:
                        make.bottom.equalTo(tip.target).offset(tip.offset)
                    case .right:
                        make.right.equalTo(tip.target).offset(tip.offset)
                    case .width:
                        make.width.equalTo(tip.target).offset(tip.offset)
                    case .height:
                        make.height.equalTo(tip.target).offset(tip.offset)
                    case .centerX:
                        make.centerX.equalTo(tip.target).offset(tip.offset)
                    case .centerY:
                        make.centerY.equalTo(tip.target).offset(tip.offset)
                    case .edges:
                        make.edges.equalTo(tip.target).offset(tip.offset)
                    case .center:
                        make.center.equalTo(tip.target).offset(tip.offset)
                    }
                }
            }
        }
        return self
    }
}

public struct snpTip {
    var extend: [ConstraintMakerExtend] = [.left]
    var target: ConstraintRelatableTarget = 0
    var offset: ConstraintOffsetTarget = 0
    
    public init(extend: [ConstraintMakerExtend],target: ConstraintRelatableTarget, offset: ConstraintOffsetTarget) {
        self.extend = extend
        self.target = target
        self.offset = offset
    }
}

public enum ConstraintMakerExtend {
    case left
    case top
    case bottom
    case right
    case width
    case height
    case centerX
    case centerY
    case edges
    case center
}
