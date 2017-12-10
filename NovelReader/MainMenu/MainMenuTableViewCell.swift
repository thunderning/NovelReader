//
//  MainMenuTableViewCell.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/8.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
