//
//  LineLayout.swift
//  test
//
//  Created by liao xuan on 16/12/15.
//  Copyright © 2016年 liao xuan. All rights reserved.
//

import Foundation

open class LineLayout: UICollectionViewFlowLayout{
    var itemW: CGFloat = 60
    var itemH: CGFloat = 80
    var row = 2
    var col = 4
    public var icount: Int?
    
    lazy var insetw: CGFloat = {
        return 0
    }()
    
    lazy var inseth: CGFloat = {
        return (((self.collectionView?.bounds.height ?? 0) - self.itemSize.height * CGFloat(self.row)) / CGFloat(self.row + 1))
    }()
    
    lazy var collw: CGFloat = {
        return self.collectionView?.bounds.width
    }()!
    
    lazy var collh: CGFloat = {
        return self.collectionView?.bounds.height
    }()!
    
    public init(row: Int, col: Int, iheight: CGFloat, fwidth: CGFloat = sw) {
        super.init()
        
        self.row = row
        self.col = col
        
        itemW = fwidth / CGFloat(col)
        itemH = iheight
        
        //设置每一个元素的大小
        self.itemSize = CGSize(width: itemW, height: itemH)
        //设置滚动方向
        self.scrollDirection = .horizontal
        //设置间距
//        self.minimumLineSpacing = 0.7 * itemW
        
    }
    
    //对一些布局的准备操作
    override open func prepare() {
        //设置边距
        self.sectionInset = UIEdgeInsetsMake(inseth, insetw, inseth, insetw)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //区域总大小
    override open var collectionViewContentSize: CGSize{
        let pageIndex:Int = Int(floor(Double(self.icount! - 1) / Double(row * col))) + 1
        return CGSize(width: CGFloat(pageIndex) * collw, height: collh)
    }
    
    
    /**
     返回true只要显示的边界发生变化就重新布局
     内部会重新调用prepareLayout和layoutAttributesForElementsInRect方法获得部分cell的布局属性
    */
//    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
//        print(newBounds)
//        return true
//    }
    
    /**
     用来计算出rect这个范围内所有cell的uicollectionviewlayoutattribues并返回
    */
    override open func layoutAttributesForElements( in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attriArray = [UICollectionViewLayoutAttributes]()
        if let count = self.icount {
            for i in 0 ..< count {
                let iPath = IndexPath(item: i, section: 0)
                let attr = self.layoutAttributesForItem(at: iPath as IndexPath)
                attriArray.append(attr!)
            }
        }
        return attriArray
    }
    
    override open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attrs.size = CGSize(width: itemW, height: itemH)
        let index = indexPath.row //序号
        let pageIndex:Int = Int(floor(Double(index) / Double(row * col))) //页数
        let rowIndex:Int = Int(floor(Double(index - pageIndex * row * col) / Double(col))) //行数
        let oindex = index - row * col * pageIndex - rowIndex * col //单行中的序号
        
        let pagex = Double(collw) * Double(pageIndex)
        let heaherx = Double(insetw) + Double(itemW) * 0.5
        let x = pagex + heaherx + (Double(oindex) * (Double(insetw) + Double(itemW)))
        let heahery = Double(inseth) + Double(itemH) * 0.5
        let y = heahery + (Double(rowIndex) * (Double(inseth) + Double(itemH)))
        
        attrs.center = CGPoint(x: x, y: y)
        return attrs
    }
}
