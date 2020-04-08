//
//  YYWebImageUtil.swift
//  iganzhou
//
//  Created by liao xuan on 17/9/17.
//  Copyright © 2017年 liao xuan. All rights reserved.
//
import Foundation
import YYWebImage

open class YYWebImageUtil {
    public static func loadImg(imgv: UIImageView?, url: String, placeholder: UIImage?) {
        imgv?.yy_setImage(with: URL(string: url), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], completion: nil)
    }
    
    public static func loadGrayImg(imgv: UIImageView?, url: String, placeholder: UIImage?) {
        imgv?.yy_setImage(with: URL(string: url.getBlackLink()), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], progress: nil, transform: { (image, url) -> UIImage? in
            return image.noir()
        }, completion: nil)
    }
    
    public static func loadifGrayImg(imgv: UIImageView?, url: String, placeholder: UIImage?) {
        imgv?.yy_setImage(with: URL(string: url.getBlackLink()), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], progress: nil, transform: { (image, url) -> UIImage? in
            return image.isnoir()
        }, completion: nil)
    }
    
    public static func loadImg(imgv: UIImageView?, url: String, placeholder: UIImage?, block: YYWebImageCompletionBlock?) {
        imgv?.yy_setImage(with: URL(string: url), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], completion: block)
    }
    
    public static func loadImgCycle(imgv: UIImageView?, url: String, placeholder: UIImage?) {
        imgv?.yy_setImage(with: URL(string: url), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], progress: nil, transform: { (image, url) -> UIImage? in
            return image.yy_image(byRoundCornerRadius: imgv!.zj_width/2)
            }, completion: nil)
    }
    
    public static func loadBtnImg(btn: UIButton, url: String, placeholder: UIImage?) {
        btn.imageView?.yy_setImage(with: URL(string: url), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], completion: { (img, url, type, stage, error) in
            btn.setImage(img, for: .normal)
        })
    }
    
    public static func loadBtnBkImg(btn: UIButton, url: String, placeholder: UIImage?) {
        btn.imageView?.yy_setImage(with: URL(string: url), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], completion: { (img, url, type, stage, error) in
            btn.setBackgroundImage(img, for: .normal)
        })
    }
    
    public static func loadSizeImg(imgv: UIImageView?, url: String, placeholder: UIImage?, imgw: CGFloat, imgh: CGFloat) {
        var nurl = ""
        let ws = url.split(separator: ".")
        for i in 0 ..< ws.count - 2 {
            nurl += ws[i]
            nurl += "."
        }
        nurl = "\(nurl)\(ws[ws.count-2])_\(Int(imgw))x\(Int(imgh)).\(ws[ws.count-1])"
//        KrtLog.debug(message: nurl)
        imgv?.yy_setImage(with: URL(string: nurl), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], completion: nil)
    }
    
    public static func loadImgCornersCycle(imgv: UIImageView?, url: String, placeholder: UIImage?,byRoundCornerRadius: CGFloat, corners: UIRectCorner, borderWidth: CGFloat, borderColor: UIColor, borderLineJoin: CGLineJoin) {
        imgv?.yy_setImage(with: URL(string: url), placeholder: placeholder, options: [YYWebImageOptions.progressiveBlur,YYWebImageOptions.setImageWithFadeAnimation], progress: nil, transform: { (image, url) -> UIImage? in
            return image.yy_image(byRoundCornerRadius: byRoundCornerRadius, corners: corners, borderWidth: borderWidth, borderColor: borderColor, borderLineJoin: borderLineJoin)
        }, completion: nil)
    }
}
