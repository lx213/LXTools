//
//  UIImageEx.swift
//  gzzhly
//
//  Created by liao xuan on 17/3/30.
//  Copyright © 2017年 zhonghao. All rights reserved.
//

import UIKit
import Foundation

import AVFoundation
// MARK: 图片设置圆角
extension UIImage {
    
    public func roundImage(byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadi: CGFloat) -> UIImage? {
        return roundImage(byRoundingCorners: byRoundingCorners, cornerRadii: CGSize(width: cornerRadi, height: cornerRadi))
    }
    
    public func roundImage(byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGSize) -> UIImage? {
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        guard context != nil else {
            return nil
        }
        context?.setShouldAntialias(true)
        let bezierPath = UIBezierPath(roundedRect: imageRect,
                                      byRoundingCorners: byRoundingCorners,
                                      cornerRadii: cornerRadii)
        bezierPath.close()
        bezierPath.addClip()
        self.draw(in: imageRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}


extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height:  reSize.height))
        
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    
    /**
     *  等比率缩放
     */
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        
        return reSizeImage(reSize: reSize)
    }
    class func imageWithColor(color: UIColor) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}

extension UIImageView{
    
    //获取网络视频截图
    
    func getNetWorkVidoeImage(url:String){
        
        DispatchQueue.global(qos: .default).async {
            //需要长时间处理的代码
            
            let asset = AVURLAsset(url:URL(string: url)!)
            
            let generator = AVAssetImageGenerator(asset: asset)
            
            generator.appliesPreferredTrackTransform=true
            
            let time = CMTimeMakeWithSeconds(0.0,600)
            
            var actualTime:CMTime = CMTimeMake(0,0)
            
            var image:CGImage!
            
            do{
                image = try generator.copyCGImage(at: time, actualTime: &actualTime)
            }catch let error as NSError{
                KrtLog.error(message:error)
            }
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    //需要主线程执行的代码
                    if image != nil {
                        self.image = UIImage(cgImage: image)
                    }else{
                        self.image = UIImage(named: "defult750-500")
                    }
                }
            }
        }
    }
}

extension UIImageView {
    
    /// 创建标注类型图片
    convenience init(pointImgUrl: String) {
        self.init()
        frame = CGRect(x: 4, y: 4, width: 22, height: 20)
        contentMode = .scaleAspectFit
        self.yy_setImage(with: URL(string: pointImgUrl), placeholder: UIImage())
    }
    
    /// 创建标注类型图片
    convenience init(RoundpointImgUrl: String) {
        self.init()
        frame = CGRect(x: 4, y: 4, width: 20, height: 20)
        contentMode = .scaleAspectFit
        self.yy_setImage(with: URL(string: RoundpointImgUrl), placeholder: UIImage())
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    /// 创建标注类型图片
    convenience init(pointImgName: String) {
        self.init()
        frame = CGRect(x: 4, y: 4, width: 22, height: 20)
        contentMode = .scaleAspectFit
        image = UIImage(named: pointImgName)
    }
    
    /// 创建标注底图
    convenience init(pointBackImg: Int) {
        self.init()
        frame = CGRect(x: 0, y: 0, width: 30, height: 42)
        contentMode = .scaleAspectFit
        image = UIImage(named: "norpoint")
    }
    
}

extension UIImage{
    /// 创建纯色image
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        
        let rect = CGRect(x:0, y:0, width:size.width == 0 ? 1.0 : size.width, height:size.height == 0 ? 1.0 : size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    /// 彩色图片置灰，灰度图片
    class func grayImage(sourceImage : UIImage) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(sourceImage.size, false, 0.0)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let context = CGContext(data: nil , width: Int(sourceImage.size.width), height: Int(sourceImage.size.height),bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        context?.draw(sourceImage.cgImage!, in: CGRect.init(x: 0, y: 0, width: sourceImage.size.width, height: sourceImage.size.height))
        let cgImage = context!.makeImage()
        let grayImage = UIImage.init(cgImage: cgImage!)
        return grayImage
    }
    
    //返回一个将白色背景变透明的UIImage
    func imageByRemoveWhiteBg() -> UIImage? {
        let colorMasking: [CGFloat] = [222, 255, 222, 255, 222, 255]
        return transparentColor(colorMasking: colorMasking)
    }
    
    //返回一个将黑色背景变透明的UIImage
    func imageByRemoveBlackBg() -> UIImage? {
        let colorMasking: [CGFloat] = [0, 32, 0, 32, 0, 32]
        return transparentColor(colorMasking: colorMasking)
    }
    //返回一个将黑色背景变透明的UIImage
    func imageByRemoveBlackBg1() -> UIImage? {
        let colorMasking: [CGFloat] = [0, 0, 0, 0, 0, 0]
        return transparentColor(colorMasking: colorMasking)
    }
    //返回一个将黑色背景变透明的UIImage
    func imageByRemoveBlackBg2() -> UIImage? {
        let colorMasking: [CGFloat] = [0, 32, 0, 32, 0, 0]
        return transparentColor(colorMasking: colorMasking)
    }
    
    func transparentColor(colorMasking:[CGFloat]) -> UIImage? {
        if let rawImageRef = self.cgImage {
            UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
            if let maskedImageRef = rawImageRef.copy(maskingColorComponents: colorMasking) {
                let context: CGContext = UIGraphicsGetCurrentContext()!
                context.translateBy(x: 0.0, y: self.size.height)
                context.scaleBy(x: 1.0, y: -1.0)
                context.draw(maskedImageRef, in: CGRect(x:0, y:0, width:self.size.width,
                                                        height:self.size.height))
                let result = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return result
            }
        }
        return nil
    }
    
 
}

