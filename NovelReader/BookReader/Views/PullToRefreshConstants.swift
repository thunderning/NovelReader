//
//  PullToRefreshConstants.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/31.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import CoreGraphics

public struct DGElasticPullToRefreshConstants {
    
    struct KeyPaths {
        static let ContentOffset = "contentOffset"
        static let ContentInset = "contentInset"
        static let Frame = "frame"
        static let PanGestureRecognizerState = "panGestureRecognizer.state"
    }
    
    public static var WaveMaxHeight: CGFloat = 70.0
    public static var MinOffsetToPull: CGFloat = 95.0
    public static var LoadingContentInset: CGFloat = 50.0
    public static var LoadingViewSize: CGFloat = 30.0
    
}
