//
//  BookcaseTableViewCell.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/10.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit

class BookcaseTableViewCell: UITableViewCell {
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var latestChapter: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
