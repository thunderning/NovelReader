//
//  ViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/1.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
import SwiftTheme
import FlowingMenu

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var books:[BookDetailItem] = []
    var menu: UIViewController?
    let flowingMenuTransitionManager = FlowingMenuTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add the pan screen edge gesture to the current view
        flowingMenuTransitionManager.setInteractivePresentationView(view)
        // Add the delegate to respond to interactive transition events
        flowingMenuTransitionManager.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.flatWhiteColorDark()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.flatWhiteColorDark()
        tableView.rowHeight = 100
        getBooks()
    }

    func getBooks() -> Void {
        let a:BookDetailItem = BookDetailItem(_id: "1", title: "再生勇士", author: "射虎", longIntro: "", cover: "", majorCate: "", minorCate: "", rating: [], latelyFollower: 0, wordCount: 0, serializeWordCount: 0, retentionRatio: "", updated: "", isSerial: false, chaptersCount: 0, lastChapter: "123", tags: [])
        books.append(a)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMainViewController(_ sender: UIStoryboardSegue){

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentMenu" {
            let vc = segue.destination as! MainMenuViewController
            vc.transitioningDelegate = flowingMenuTransitionManager
            // 修改菜单大小
             vc.view.frame = CGRect(x: 0, y: 0, width: 250, height: vc.view.frame.height)
            flowingMenuTransitionManager.setInteractiveDismissView(vc.view)
            vc.mainView = self
            menu = vc
        }
    }
    
    

}
//调用第三方库，使用侧滑菜单
extension ViewController: FlowingMenuDelegate{
    func flowingMenuNeedsPresentMenu(_ flowingMenu: FlowingMenuTransitionManager) {
        performSegue(withIdentifier: "PresentMenu", sender: self)
    }
    
    func flowingMenuNeedsDismissMenu(_ flowingMenu: FlowingMenuTransitionManager) {
        menu?.performSegue(withIdentifier: "unwindToMainFromMenu", sender: self)
    }
}
//tableview委托
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookcaseTableViewCell") as? BookcaseTableViewCell
        cell?.bookName.text = books[indexPath.row].title
        cell?.latestChapter.text = books[indexPath.row].lastChapter
        cell?.backgroundColor = UIColor.flatWhite()
        return cell!
    }
    
}
