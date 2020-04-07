//
//  BlackTools.swift
//  iganzhou
//
//  Created by 廖轩 on 2020/4/7.
//  Copyright © 2020 liao xuan. All rights reserved.
//

import Foundation

open class KrtBlackTools {
    
    public static let instance = KrtBlackTools()
    
    public var isblack = false
    public var linkUrl = "http://218.204.105.54:9902/qk/blackDate.json"
    var startTime = "" {
        didSet{
            UserDefaults.standard.set(startTime, forKey: "startTime")
        }
    }
    var endTime = "" {
        didSet{
            UserDefaults.standard.set(endTime, forKey: "endTime")
        }
    }
    
    public init() {
        if let st = UserDefaults.standard.string(forKey: "startTime") {
            startTime = st
        }
        if let et = UserDefaults.standard.string(forKey: "endTime") {
            endTime = et
        }
        checkBlack()
    }
    
    //获取灰屏时间
    public func getBlackDate() {
        NSURLConnection.sendAsynchronousRequest(URLRequest(url: URL(string: "\(linkUrl)?\(Date().timeIntervalSince1970)")!   ), queue: OperationQueue.main, completionHandler: { (resp, data, error) in
         
                var dct = Dictionary<String,AnyObject>()
                if let e = error {
                    
                    print(e.localizedDescription)
                    
                }else{
                    do{
                        dct = (try JSONSerialization.jsonObject(with: data!, options:[])) as! Dictionary<String, AnyObject>
                        KrtLog.debug(message: dct)
                        self.startTime = dct["startTime"] as! String
                        self.endTime = dct["endTime"] as! String
                        self.checkBlack()
                        //    if app.UerLoginState {
                    }catch let error as NSError {
                        print("\(error.localizedDescription)")
                    }
                }
            }
        )
    }
    
    //判断是否需要灰屏
    func checkBlack() {
        if let sd = startTime.toDate(format: "yyyy-MM-dd HH:mm:ss"),let ed = endTime.toDate(format: "yyyy-MM-dd HH:mm:ss") {
            KrtLog.debug(message: sd < Date())
            isblack = (sd < Date() && ed > Date())
        }else{
            isblack = false
        }
    }
    
}

extension UIImage {
    //黑白效果滤镜
    func noir() -> UIImage?
    {
        let imageData = self.pngData()
        let inputImage = CoreImage.CIImage(data: imageData!)
        let context = CIContext(options:nil)
        let filter = CIFilter(name:"CIPhotoEffectNoir")
        filter!.setValue(inputImage, forKey: kCIInputImageKey)
        if let outputImage = filter!.outputImage {
            let outImage = context.createCGImage(outputImage, from: outputImage.extent)
            return UIImage(cgImage: outImage!)
        }
        return nil
    }
    
    func isnoir() -> UIImage?{
        return KrtBlackTools.instance.isblack ? self.noir() : self
    }
}

extension String {
    //黑白缓存链接
    func getBlackLink() -> String {
        if KrtBlackTools.instance.isblack {
            if self.contains("?") {
                return self + "&gray"
            }else{
                return self + "?gray"
            }
        }else{
            return self
        }
    }
}
