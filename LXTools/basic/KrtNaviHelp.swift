//
//  KrtNaviHelp.swift
//  LXTools
//
//  Created by 廖轩 on 2020/9/14.
//  Copyright © 2020 廖轩. All rights reserved.
//

import Foundation
import MapKit

open class KrtNaviHelp {
    
    public static let instance = KrtNaviHelp()
    
    ///调起导航
    public func go2Map(_ annotation:CLLocationCoordinate2D, title: String, vc: UIViewController?, QQreferer: String = "", loctype: String = "bd09ll") {
        func goToSystemMap(){//嵌套函数
            let currentLocation = MKMapItem.forCurrentLocation()
            let toLocation = MKMapItem.init(placemark: MKPlacemark.init(coordinate: annotation, addressDictionary: nil))
            MKMapItem.openMaps(with: [currentLocation, toLocation],launchOptions: [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey:true])
        }
        
        //======其他地图都没的话就直接用系统地图========
        if !UIApplication.shared.canOpenURL(URL.init(string: "baidumap://")!) && !UIApplication.shared.canOpenURL(URL.init(string: "iosamap://")!) && !UIApplication.shared.canOpenURL(URL.init(string: "qqmap://")!){
            goToSystemMap()
            return
        }
        
        let alertController = UIAlertController(title: "选择导航地图", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel) { (action) in
            
        }
        //==================系统地图============
        let appleAction = UIAlertAction(title: "系统地图", style: .default){ (action) in
            goToSystemMap()
        }
        //腾讯地图
        if UIApplication.shared.canOpenURL(URL.init(string: "qqmap://")!) {
            let gaodeAction = UIAlertAction(title: "腾讯地图", style: .default){ (action) in
                let urlString = "qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&to=\(title)&tocoord=\(annotation.latitude),\(annotation.longitude)&referer=\(QQreferer)"
                let escapedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                UIApplication.shared.openURL(URL.init(string: escapedString!)!)
            }
            alertController.addAction(gaodeAction)
        }
        //=================百度地图=============
        if UIApplication.shared.canOpenURL(URL.init(string: "baidumap://")!) {//判断是否安装了地图
            let baiduAction = UIAlertAction(title: "百度地图", style: .default){ (action) in
                //origin={{我的位置}} ，目的地随便写
                let urlString = "baidumap://map/direction?origin={{我的位置}}&destination=latlng:\(annotation.latitude),\(annotation.longitude)|name=\(String(describing: title))&mode=driving&coord_type=\(loctype)"
                let escapedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                UIApplication.shared.openURL(URL.init(string: escapedString!)!)
            }
            alertController.addAction(baiduAction)
        }
        //高德地图
        if UIApplication.shared.canOpenURL(URL.init(string: "iosamap://")!) {
            let gaodeAction = UIAlertAction(title: "高德地图", style: .default){ (action) in
                let urlString = "iosamap://navi?sourceApplication=你应用的名字&backScheme=youappscheme&lat=\(annotation.latitude)&lon=\(annotation.longitude)&dev=0&style=2"
                let escapedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                UIApplication.shared.openURL(URL.init(string: escapedString!)!)
            }
            alertController.addAction(gaodeAction)
        }
        
        
        alertController.addAction(cancelAction)
        alertController.addAction(appleAction)
        
        vc?.present(alertController, animated: true, completion: nil)

    }

}
