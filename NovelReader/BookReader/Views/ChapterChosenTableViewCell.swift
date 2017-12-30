//
//  ChapterChosenTableViewCell.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/31.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit

class ChapterChosenTableViewCell: UITableViewCell {
    @IBOutlet weak var numberView: UILabel!
    @IBOutlet weak var titleView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
