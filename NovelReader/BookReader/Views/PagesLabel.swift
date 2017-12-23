//
//  PagesLabel.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/22.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit

class PagesLabel: UILabel {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.text = "第\(currentPage)/\(pagesCount)页"
    }
    */
    var pagesCount = 0
    var currentPage = 0
    func update(){
        self.text = "第\(currentPage)/\(pagesCount)页"
    }
    func nextPage() -> Bool {
        if currentPage + 1 > pagesCount {
            return false
        }
        else{
            currentPage = currentPage + 1
            update()
            return true
        }
    }
    func prePage() -> Bool{
        if currentPage - 1 <= 0{
            return false
        }
        else{
            currentPage = currentPage - 1
            update()
            return true
        }
    }
}
