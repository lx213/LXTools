//
//  LineCollectionView.swift
//  NCqybf
//
//  Created by 廖轩 on 2018/10/23.
//  Copyright © 2018年 余晓. All rights reserved.
//

import UIKit

@objc public protocol LineCollectionDelegate{
    /// 点击事件
    func LCItemClick(target: LineCollectionView,index: Int)
    /// 卡片初始化
    func LCCellForItem(target: LineCollectionView,cell: UICollectionViewCell, index: Int) -> UICollectionViewCell
}

open class LineCollectionView: UIView {

    public var dataCount = 0 {
        didSet {
            ll.icount = dataCount
            cn?.reloadData()
            let pageIndex:Int = Int(floor(Double(dataCount - 1) / Double(onePageSize))) + 1
            mpc.numberOfPages = pageIndex
            if dataCount <= onePageSize {
                mpc.isHidden = true
            }else{
                mpc.isHidden = false
            }
        }
    }
    var cn:UICollectionView?
    var mpc = UIPageControl()
    var ll: LineLayout!
    var onePageSize = 8
    weak var delegate: LineCollectionDelegate?
    
    public init(row: Int, col: Int, size: CGSize) {
        super.init(frame: CGRect.zero)
        onePageSize = row * col
        ll = LineLayout(row: row, col: col ,iheight: size.height/2)
        ll.icount = dataCount
        cn = UICollectionView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height), collectionViewLayout: ll)
        cn?.backgroundColor = UIColor.white
        cn?.delegate = self
        cn?.dataSource = self
        cn?.isPagingEnabled = true
        cn?.showsHorizontalScrollIndicator = false
        cn?.register(MCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(cn!)
        mpc.currentPageIndicatorTintColor = UIColor(hex: 0x1290ff)
        mpc.pageIndicatorTintColor = UIColor(valueRGB: 0xdbdbdb)
        self.addSubview(mpc)
        mpc.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(10)
        }
        mpc.isHidden = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LineCollectionView:UICollectionViewDataSource,UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MCollectionViewCell
        if let dg = delegate {
            weak var wself = self
            let ncell = dg.LCCellForItem(target: wself!, cell: cell, index: indexPath.row)
            return ncell
        }else{
            return cell
        }
    }
    
    private func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        weak var wself = self
        delegate?.LCItemClick(target: wself!, index: indexPath.row)
    }
}
