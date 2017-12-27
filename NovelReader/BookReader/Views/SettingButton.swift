//
//  SettingButton.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/28.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
@IBDesignable
class SettingButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor(red: 142/255.0, green: 193/255.0, blue: 255/255.0, alpha: 0.9).cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor(red: 142/255.0, green: 193/255.0, blue: 255/255.0, alpha: 0.9).cgColor
        layer.borderWidth = 1
    }
}
