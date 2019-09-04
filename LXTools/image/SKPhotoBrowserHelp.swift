//
//  CustomYYCache.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2018/4/8.
//  Copyright © 2018年 赣州科睿特软件. All rights reserved.
//

import Foundation
import SKPhotoBrowser
import YYWebImage

public struct SKPhotoItem {
    
    public init(url: String, caption: String) {
        self.url = url
        self.caption = caption
    }
    
    var url = ""
    var caption = ""
}

open class SKPhotoBrowserHelp {
    ///浏览图片
    public static func showPhotos(skItems: [SKPhotoItem], index: Int) {
        let imgs = skItems.map{
            item -> SKPhoto in
            let photo = SKPhoto.photoWithImageURL(item.url, holder: nil)
            photo.caption = item.caption
            photo.shouldCachePhotoURLImage = true
            return photo
        }
        
        let browser = SKPhotoBrowser(photos: imgs, initialPageIndex: index)
        let vc = KrtVCHelp.topViewController()
        vc?.present(browser, animated: true, completion: nil)
    }
}

open class CustomYYCache: SKImageCacheable {
    public func removeAllImages() {
        
    }
    
    public func imageForKey(_ key: String) -> UIImage? {
        guard let image = cache.getImageForKey(key) else {
            return nil
        }
        return image
    }
    
    public func setImage(_ image: UIImage, forKey key: String) {
        cache.setImage(image, forKey: key)
    }
    
    public func removeImageForKey(_ key: String) {
        cache.removeImage(forKey: key)
    }
    
    var cache: YYImageCache
    
    public init() {
        cache = YYWebImageManager.shared().cache!
    }
}
