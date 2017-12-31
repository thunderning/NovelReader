//
//  TagsView.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2018/1/1.
//  Copyright © 2018年 吴佳玮. All rights reserved.
//

import UIKit
@IBDesignable
class TagsView: UIView {
    let verticalSpace:CGFloat = 5
    let horizontalSpace:CGFloat = 10
    var nextPoint:CGPoint = CGPoint.init(x: 10, y: 10)
    let subViewSize:CGSize = CGSize.init(width: 200, height: 20)
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func addTag(str:String) -> Void {
        //self.layoutIfNeeded()
        var t = TagLabel.init(frame: CGRect.init(origin: nextPoint, size: subViewSize), str: str)
        if nextPoint.x + t.frame.width > self.frame.width - horizontalSpace {
            nextPoint.y = nextPoint.y + subViewSize.height + self.verticalSpace
            nextPoint.x = horizontalSpace
            t = TagLabel.init(frame: CGRect.init(origin: nextPoint, size: subViewSize), str: str)
        }
        nextPoint.x = nextPoint.x + t.frame.width + self.horizontalSpace
        self.addSubview(t)
    }

}
