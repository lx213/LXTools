//
//  Ex_UICollectionView.swift
//  LXTools
//
//  Created by 廖轩 on 2019/10/12.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation

extension UICollectionView {
    
    ///设置delegate
    public func msetDelegate(delegate: UICollectionViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }
    
    ///设置dataSource
    public func msetDataSource(dataSource: UICollectionViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }
    
    ///设置内边距
    public func msetInset(inset:UIEdgeInsets) -> Self {
        self.contentInset = inset
        return self
    }
    
    ///注册cell
    public func mRegister(cellClass: AnyClass?,forCellWithReuseIdentifier: String) -> Self {
        self.register(cellClass, forCellWithReuseIdentifier: forCellWithReuseIdentifier)
        return self
    }
    
    ///是否显示垂直滑动指示器
    public func msetShowVerticalScrollIndicator(show: Bool) -> Self {
        let tb = UITableView()
        
        self.showsVerticalScrollIndicator = show
        return self
    }
    
    ///是否显示水平滑动指示器
    public func msetShowHorizontalScrollIndicator(show: Bool) -> Self {
        let tb = UICollectionView()
        
        self.showsHorizontalScrollIndicator = show
        return self
    }
    
    ///注册头部或尾部布局
    public func mRegisterHeader(cellClass: AnyClass?,forSupplementaryViewOfKind: String,withReuseIdentifier:String) ->Self {
        self.register(cellClass, forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: withReuseIdentifier)
        return self
    }
}
