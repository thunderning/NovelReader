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
import SwiftTheme
import PKHUD

class BookRankViewController: UIViewController {
    @IBOutlet weak var tableVIew: UITableView!
    var items:[BookRankItem] = []
    var itemses:BookRankItems? = nil
    var segmentioView: Segmentio!
    var selectRank:Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        setSeg()
        getItems()
        tableVIew.tableFooterView = UIView()
        tableVIew.rowHeight = 50
        tableVIew.theme_backgroundColor = themeBackgroundColors
        view.theme_backgroundColor = themeBackgroundColors
        // Do any additional setup after loading the view.
    }
    func getItems(){
        connectService.getRanksByGender(sender: self){ (data,response,error) in
            if error != nil{
                DispatchQueue.main.async {
                    HUD.flash(.labeledError(title: "网络错误", subtitle: "请更改网络状态重试"), delay: 1.0)
                }
            }
            else{
                let decoder = JSONDecoder()
                //print(response)
                if let json = try? decoder.decode(BookRankItems.self, from: data!){
                    //print(json)
                    self.itemses = json
                    self.items = json.male
                    DispatchQueue.main.async {
                        self.tableVIew.reloadData()
                    }
                }
                else{
                    DispatchQueue.main.async {
                        HUD.flash(.labeledError(title: "服务器编码错误", subtitle: nil), delay: 1)
                    }
                }
            }
        }
    }
    func setSeg() -> Void {
        let segmentioViewRect = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 40)
        segmentioView = Segmentio(frame: segmentioViewRect)
        view.addSubview(segmentioView)
        let segIndicatorOptions = SegmentioIndicatorOptions.init(type: .top, ratio: 1, height: 5, color: UIColor(red: 142/255.0, green: 193/255.0, blue: 255/255.0, alpha: 0.9))
        let segHorizontalOptions = SegmentioHorizontalSeparatorOptions.init(type: .topAndBottom, height: 0, color: .clear)
        let segVerticalOptions = SegmentioVerticalSeparatorOptions.init(ratio: 0.6, color: UIColor.flatBlueColorDark())
        let segState = SegmentioState.init(backgroundColor: .clear, titleFont: .systemFont(ofSize: 22), titleTextColor: .black)
        let segStates = SegmentioStates(defaultState: segState, selectedState: segState, highlightedState: segState)
        let segOption:SegmentioOptions = SegmentioOptions.init(backgroundColor: .clear, maxVisibleItems: 4, scrollEnabled: false, indicatorOptions: segIndicatorOptions, horizontalSeparatorOptions: segHorizontalOptions , verticalSeparatorOptions: segVerticalOptions, imageContentMode: .center, labelTextAlignment: .center, labelTextNumberOfLines: 1, segmentStates: segStates, animationDuration: 0.2)
        segmentioView.setup(content: [SegmentioItem.init(title: "男生", image: #imageLiteral(resourceName: "男")),SegmentioItem.init(title: "女生", image: #imageLiteral(resourceName: "女"))], style: .imageBeforeLabel, options: segOption)
        segmentioView.selectedSegmentioIndex = 0
        segmentioView.valueDidChange = {
            segmentio, segmentIndex in
            ThemeManager.setTheme(index: 1)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRankDetail" {
            let vc = segue.destination as! BookRankDetailTableViewController
            vc.rankId = items[selectRank!]._id
        }
    }

}

extension BookRankViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectRank = indexPath.row
        self.performSegue(withIdentifier: "showRankDetail", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookRankTableViewCell") as? BookRankTableViewCell
        let item = items[indexPath.row]
        cell?.rankTitle.text = item.title
        cell?.accessoryType = .disclosureIndicator
        cell?.theme_backgroundColor = themeCellColors
        connectService.getImage(sender: self, urlstring: item.cover){(data,response,error) in
            if error != nil{
                //fatalError("更新是网络错误")
            }
            else{
                DispatchQueue.main.async {
                    cell?.rankImage.image = UIImage.init(data: data!)
                }
            }
            
        }
        return cell!
    }
    
    
}
