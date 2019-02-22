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
        let vc = topViewController()
        vc?.present(browser, animated: true, completion: nil)
    }
}
