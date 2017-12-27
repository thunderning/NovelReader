//
//  BackgroundChooseView.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/28.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
@IBDesignable
class BackgroundChooseView: UIButton{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius =  16
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius =  16
    }
    
}
