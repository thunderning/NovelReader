//
//  PullToRefreshLoadingView.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/31.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//



import UIKit

open class DGElasticPullToRefreshLoadingView: UIView {
    
    // MARK: -
    // MARK: Vars
    
    lazy var maskLayer: CAShapeLayer = {
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.fillColor = UIColor.black.cgColor
        maskLayer.actions = ["path" : NSNull(), "position" : NSNull(), "bounds" : NSNull()]
        self.layer.mask = maskLayer
        return maskLayer
    }()
    
    // MARK: -
    // MARK: Constructors
    
    public init() {
        super.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Methods
    
    open func setPullProgress(_ progress: CGFloat) {
        
    }
    
    open func startAnimating() {
        
    }
    
    open func stopLoading() {
        
    }
    
}
