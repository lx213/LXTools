//
//  Ex_UITableView.swift
//  LXTools
//
//  Created by 廖轩 on 2019/4/22.
//  Copyright © 2019 廖轩. All rights reserved.
//

import Foundation

extension UITableView {
    ///设置delegate
    public func msetDelegate(delegate: UITableViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }
    
    ///设置dataSource
    public func msetDataSource(dataSource: UITableViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }
    
    ///设置内边距
    public func msetInset(inset:UIEdgeInsets) -> Self {
        self.contentInset = inset
        return self
    }
    
    ///设置tableFooterView
    public func msetTableFooterView(view: UIView?) -> Self {
        self.tableFooterView = view
        return self
    }
    
    ///设置estimatedRowHeight
    public func msetEstimatedRowHeight(estimatedRowHeight: CGFloat) -> Self {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    ///设置autoresizingMask
    public func msetAutoresizingMask(autoresizingMask: UIViewAutoresizing) -> Self {
        self.autoresizingMask = autoresizingMask
        return self
    }
    
    ///设置行高
    public func msetRowHeight(rowHeight: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }
    
    ///注册cell
    public func mRegister(cellClass: AnyClass?,forCellReuseIdentifier: String) -> Self {
        self.register(cellClass, forCellReuseIdentifier: forCellReuseIdentifier)
        return self
    }
    
    ///设置分割线样式
    public func msetSeparatorStyle(separatorStyle: UITableViewCellSeparatorStyle) -> Self {
        self.separatorStyle = separatorStyle
        return self
    }
    
    ///是否显示垂直滑动指示器
    public func msetShowVerticalScrollIndicator(show: Bool) -> Self {
        let tb = UITableView()
        
        self.showsVerticalScrollIndicator = show
        return self
    }
}
