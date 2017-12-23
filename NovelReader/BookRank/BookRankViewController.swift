//
//  BookRankViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/11.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
import Segmentio
import Chameleon
import Foundation

class BookRankViewController: UIViewController {
    @IBOutlet weak var tableVIew: UITableView!
    var items:[BookRankItem] = []
    var itemses:BookRankItems? = nil
    var segmentioView: Segmentio!
    override func viewDidLoad() {
        super.viewDidLoad()
        setSeg()
        getItems()
        tableVIew.tableFooterView = UIView()
        tableVIew.rowHeight = 50
        tableVIew.backgroundColor = UIColor.flatWhiteColorDark()
        // Do any additional setup after loading the view.
    }
    func getItems(){
        let m1 = BookRankItem(_id: "", title: "男生1", cover: "", shortTitle: "")
        let m2 = BookRankItem(_id: "", title: "男生2", cover: "", shortTitle: "")
        let f1 = BookRankItem(_id: "", title: "女生1", cover: "", shortTitle: "")
        let f2 = BookRankItem(_id: "", title: "女生2", cover: "", shortTitle: "")
        itemses = BookRankItems(female: [f1,f2], male: [m1,m2])
        items = (itemses?.male)!
    }
    func setSeg() -> Void {
        let segmentioViewRect = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 60)
        segmentioView = Segmentio(frame: segmentioViewRect)
        view.addSubview(segmentioView)
        segmentioView.setup(content: [SegmentioItem.init(title: "男生", image: nil),SegmentioItem.init(title: "女生", image: nil)], style: .onlyLabel, options: nil)
        segmentioView.selectedSegmentioIndex = 0
        segmentioView.valueDidChange = {
            segmentio, segmentIndex in
            if segmentIndex == 0 {
                self.items = (self.itemses?.male)!
            }
            else{
                self.items = (self.itemses?.female)!
            }
            self.tableVIew.reloadData()
        }
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

extension BookRankViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookRankTableViewCell") as? BookRankTableViewCell
        let item = items[indexPath.row]
        cell?.rankTitle.text = item.title
        cell?.accessoryType = .disclosureIndicator
        cell?.backgroundColor = UIColor.flatWhite()
        return cell!
    }
    
    
}
