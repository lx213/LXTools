//
//  MJRefreshController.swift
//  Gzly_xcode9
//
//  Created by 廖轩 on 2018/3/27.
//  Copyright © 2018年 赣州科睿特软件. All rights reserved.
//

import Foundation
import MJRefresh

@objc public protocol MJRefreshController {
    var needDownRefresh: Bool { get set }
    var needUpRefresh: Bool { get set }
    var mjScrollView: UIScrollView { get set }
    
    @objc func downRefresh()
    @objc func upRefresh()
}

extension MJRefreshController {
    
    ///初始化下拉刷新
    public func setupRefresh() {
        if needDownRefresh {
            let header = MJRefreshNormalHeader()
            header.setRefreshingTarget(self, refreshingAction: #selector(downRefresh))
            mjScrollView.mj_header = header
        }
    }
    
    ///移除下拉刷新
    public func removeRefresh() {
        mjScrollView.mj_header = nil
    }
    
    ///结束下拉刷新
    public func headerEndRefreshing() {
        if needDownRefresh {
            mjScrollView.mj_header.endRefreshing()
        }
    }
    ///结束加载更多
    public func footerEndRefreshing() {
        if needUpRefresh && mjScrollView.mj_footer != nil {
            mjScrollView.mj_footer.endRefreshing()
        }
    }
    ///结束加载更多并显示无更多数据
    public func footerEndRefreshingWithNoMoreData() {
        if needUpRefresh && mjScrollView.mj_footer != nil {
            mjScrollView.mj_footer.endRefreshingWithNoMoreData()
        }
    }
    ///重置无更多数据状态
    public func footerResetNoMoreData() {
        if needUpRefresh && mjScrollView.mj_footer != nil {
            mjScrollView.mj_footer.resetNoMoreData()
        }
    }
    ///设置加载更多
    public func setFooter() {
        if needUpRefresh {
            let footer = MJRefreshAutoStateFooter()
            footer.setRefreshingTarget(self, refreshingAction: #selector(upRefresh))
            footer.setTitle("没有更多数据", for: MJRefreshState.noMoreData)
            footer.setTitle("正在加载...", for: MJRefreshState.refreshing)
            mjScrollView.mj_footer = footer
        }
    }
    
}
