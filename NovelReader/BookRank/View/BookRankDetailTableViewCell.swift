//
//  BookRankDetailTableViewCell.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2018/1/1.
//  Copyright © 2018年 吴佳玮. All rights reserved.
//

import UIKit

class BookRankDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var authorAndCatsView: UILabel!
    
    @IBOutlet weak var followerView: UILabel!
    @IBOutlet weak var introView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
