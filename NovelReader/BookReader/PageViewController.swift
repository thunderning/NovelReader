//
//  PageViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/22.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var contentView: UILabel!
    @IBOutlet weak var batteryView: BatteryView!
    @IBOutlet weak var timeView: UILabel!
    @IBOutlet weak var pagesView: PagesLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layoutIfNeeded()
        contentView.font = UIFont.systemFont(ofSize: 22)
        //print(contentView)
        let date = Date()
        let a  = ChapterItem(link: "", font: .systemFont(ofSize: 22))
        let millionSecond = NSDate().timeIntervalSince(date)
        print(millionSecond)
        contentView.text = a.content.last
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
