//
//  SourceChosenViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/31.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
import PKHUD

class SourceChosenViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var bookId:String = ""
    var sourceItems:[BookSourceItem] = []
    var selectSource:String? =  nil
    var backColor:UIColor? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let s1 = DispatchSemaphore(value: 0)
        connectService.getBookSources(sender: self, bookId: bookId){ (data,response,error) in
            if error != nil{
                DispatchQueue.main.async {
                    HUD.flash(.labeledError(title: "网络错误", subtitle: "请更改网络状态重试"), delay: 1.0)
                }
                self.performSegue(withIdentifier: "returnToReader", sender: self)
            }
            else{
                let decoder = JSONDecoder()
                //print(response)
                if let json = try? decoder.decode([BookSourceItem].self, from: data!){
                    //print(json)
                    //默认选第二个源，因为第一个为正版源
                    self.sourceItems = json
                }
                else{
                    DispatchQueue.main.async {
                        HUD.flash(.labeledError(title: "服务器编码错误", subtitle: nil), delay: 1.0)
                    }
                }
            }
            s1.signal()
        }
        s1.wait()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = backColor
        view.backgroundColor = backColor
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

extension SourceChosenViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectSource = sourceItems[indexPath.row]._id
        self.performSegue(withIdentifier: "returnToReader", sender: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourceChosenTableViewCell", for: indexPath) as? SourceChosenTableViewCell
        let source = sourceItems[indexPath.row]
            cell?.titleView.text = source.name
            cell?.latestChapterView.text = source.lastChapter
            if (source._id == selectSource) {
                cell?.titleView.attributedText = NSAttributedString.init(string: source.name, attributes: [NSAttributedStringKey.foregroundColor:UIColor.flatRedColorDark()])
                cell?.latestChapterView.attributedText = NSAttributedString.init(string: source.lastChapter, attributes: [NSAttributedStringKey.foregroundColor:UIColor.flatRed()])
            }
        
        cell?.accessoryType = .disclosureIndicator
        cell?.backgroundColor = backColor
        return cell!
    }
}
