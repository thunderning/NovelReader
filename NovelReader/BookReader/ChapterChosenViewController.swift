//
//  ChapterChosenViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/31.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
//import APESuperHUD
import PKHUD

class ChapterChosenViewController: UIViewController {
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    var links:[LinkType] = []
    var selectChapter:Int? = nil
    var backColor:UIColor? = nil
    var sourceId:String = ""
    var currentChapter:Int = 0
    var isReversed:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backColor
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            let s1 = DispatchSemaphore(value: 0)
            connectService.getChapterListByBookSource(sender: self!, bookSourceId:(self?.sourceId)!){ (data,response,error) in
                if error != nil{
                    DispatchQueue.main.async {
                        HUD.flash(.labeledError(title: "网络错误", subtitle: "请更改网络状态重试"), delay: 1.0)
                    }
                }
                else{
                    let decoder = JSONDecoder()
                    //print(response)
                    if let json = try? decoder.decode(ChapterListItemAtoc.self, from: data!){
                        //print(json)
                        self?.links = json.chapters
                        if (self?.isReversed)! {
                            self?.links.reverse()
                        }
                    }
                    else{
                        DispatchQueue.main.async {
                            HUD.flash(.labeledError(title: "服务器编码错误", subtitle: nil), delay: 1)
                        }
                    }
                }
                s1.signal()
            }
            s1.wait()
            self?.tableView.reloadData()
            self?.tableView.dg_stopLoading()
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor.flatBlack())
        tableView.dg_setPullToRefreshBackgroundColor(backColor!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reverseData() -> Void {
        isReversed = !isReversed
        if isReversed {
            reverseButton.setTitle("正序", for: .normal)
        }
        else{
            reverseButton.setTitle("倒序", for: .normal)
        }
        links.reverse()
        //currentChapter = links.count - 1 - currentChapter
        tableView.reloadData()
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

extension ChapterChosenViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if isReversed {
            selectChapter = links.count - 1 - indexPath.row
        }
        else {
            selectChapter = indexPath.row
        }
        self.performSegue(withIdentifier: "returnToReader", sender: self)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterChosenTableViewCell", for: indexPath) as? ChapterChosenTableViewCell
        let link = links[indexPath.row]
        if !isReversed {
            cell?.numberView.text = "\(indexPath.row + 1)."
            cell?.titleView.text = link.title
            if (indexPath.row == currentChapter) {
                cell?.numberView.attributedText = NSAttributedString.init(string: "\(indexPath.row + 1).", attributes: [NSAttributedStringKey.foregroundColor:UIColor.flatRedColorDark()])
                cell?.titleView.attributedText = NSAttributedString.init(string: link.title, attributes: [NSAttributedStringKey.foregroundColor:UIColor.flatRed()])
            }
        }
        else{
            cell?.numberView.text = "\(links.count - indexPath.row)."
            cell?.titleView.text = link.title
            if (indexPath.row == links.count - 1 - currentChapter) {
                cell?.numberView.attributedText = NSAttributedString.init(string: "\(links.count - indexPath.row).", attributes: [NSAttributedStringKey.foregroundColor:UIColor.flatRedColorDark()])
                cell?.titleView.attributedText = NSAttributedString.init(string: link.title, attributes: [NSAttributedStringKey.foregroundColor:UIColor.flatRed()])
            }
        }
        
        
        cell?.accessoryType = .disclosureIndicator
        cell?.backgroundColor = backColor
        return cell!
    }
}
