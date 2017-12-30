//
//  PullToRefreshExtensions.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/31.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
import ObjectiveC

// MARK: -
// MARK: (NSObject) Extension
public extension NSObject {
    
    // MARK: -
    // MARK: Vars
    
    fileprivate struct dg_associatedKeys {
        static var observersArray = "observers"
    }
    
    fileprivate var dg_observers: [[String : NSObject]] {
        get {
            if let observers = objc_getAssociatedObject(self, &dg_associatedKeys.observersArray) as? [[String : NSObject]] {
                return observers
            } else {
                let observers = [[String : NSObject]]()
                self.dg_observers = observers
                return observers
            }
        } set {
            objc_setAssociatedObject(self, &dg_associatedKeys.observersArray, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: -
    // MARK: Methods
    
    public func dg_addObserver(_ observer: NSObject, forKeyPath keyPath: String) {
        let observerInfo = [keyPath : observer]
        
        if dg_observers.index(where: { $0 == observerInfo }) == nil {
            dg_observers.append(observerInfo)
            addObserver(observer, forKeyPath: keyPath, options: .new, context: nil)
        }
    }
    
    public func dg_removeObserver(_ observer: NSObject, forKeyPath keyPath: String) {
        let observerInfo = [keyPath : observer]
        
        if let index = dg_observers.index(where: { $0 == observerInfo}) {
            dg_observers.remove(at: index)
            removeObserver(observer, forKeyPath: keyPath)
        }
    }
    
}

// MARK: -
// MARK: (UIScrollView) Extension
public extension UIScrollView {
    
    // MARK: - Vars
    fileprivate struct dg_associatedKeys {
        static var pullToRefreshView = "pullToRefreshView"
    }
    
    fileprivate var pullToRefreshView: DGElasticPullToRefreshView? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.pullToRefreshView) as? DGElasticPullToRefreshView
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.pullToRefreshView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - Methods (Public)
    
    public func dg_addPullToRefreshWithActionHandler(_ actionHandler: @escaping () -> Void, loadingView: DGElasticPullToRefreshLoadingView?) {
        isMultipleTouchEnabled = false
        panGestureRecognizer.maximumNumberOfTouches = 1
        
        let pullToRefreshView = DGElasticPullToRefreshView()
        self.pullToRefreshView = pullToRefreshView
        pullToRefreshView.actionHandler = actionHandler
        pullToRefreshView.loadingView = loadingView
        addSubview(pullToRefreshView)
        
        pullToRefreshView.observing = true
    }
    
    public func dg_removePullToRefresh() {
        pullToRefreshView?.disassociateDisplayLink()
        pullToRefreshView?.observing = false
        pullToRefreshView?.removeFromSuperview()
    }
    
    public func dg_setPullToRefreshBackgroundColor(_ color: UIColor) {
        pullToRefreshView?.backgroundColor = color
    }
    
    public func dg_setPullToRefreshFillColor(_ color: UIColor) {
        pullToRefreshView?.fillColor = color
    }
    
    public func dg_stopLoading() {
        pullToRefreshView?.stopLoading()
    }
}

// MARK: -
// MARK: (UIView) Extension
public extension UIView {
    func dg_center(_ usePresentationLayerIfPossible: Bool) -> CGPoint {
        if usePresentationLayerIfPossible, let presentationLayer = layer.presentation() {
            // Position can be used as a center, because anchorPoint is (0.5, 0.5)
            return presentationLayer.position
        }
        return center
    }
}

// MARK: -
// MARK: (UIPanGestureRecognizer) Extension
public extension UIPanGestureRecognizer {
    func dg_resign() {
        isEnabled = false
        isEnabled = true
    }
}

// MARK: -
// MARK: (UIGestureRecognizerState) Extension
public extension UIGestureRecognizerState {
    func dg_isAnyOf(_ values: [UIGestureRecognizerState]) -> Bool {
        return values.contains(where: { $0 == self })
    }
}
