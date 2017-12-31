//
//  TagLabel.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/31.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit

class TagLabel: UILabel {

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
        backgroundColor = UIColor.init(randomFlatColorOf: .light)
        textColor = UIColor.init(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: true)
        let a:NSString = "1234"
        self.clipsToBounds = true
    }
    
    init(frame:CGRect,str:String) {
        super.init(frame: frame)
        layer.cornerRadius = 10.0
        var contentSize = (NSString.init(string: str).boundingRect(with: CGSize.init(width: 200, height: 20), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)).size
        contentSize.width = contentSize.width + 20
        self.frame.size = contentSize
        backgroundColor = UIColor.init(randomFlatColorOf: .light)
        textColor = UIColor.init(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: false)
        self.clipsToBounds = true
        self.text = str
        self.font = UIFont.systemFont(ofSize: 15)
        self.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        backgroundColor = UIColor.init(randomFlatColorOf: .light)
        textColor = UIColor.init(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: true)
        self.clipsToBounds = true
    }
}
