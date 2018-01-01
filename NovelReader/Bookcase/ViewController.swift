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
import PKHUD

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var books:[CoreBookInfo] = []
    var menu: UIViewController?
    var selectId:String? = nil
    let flowingMenuTransitionManager = FlowingMenuTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.setTheme(index: 0)
        // Add the pan screen edge gesture to the current view
        flowingMenuTransitionManager.setInteractivePresentationView(view)
        // Add the delegate to respond to interactive transition events
        flowingMenuTransitionManager.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        view.theme_backgroundColor = themeBackgroundColors
        tableView.tableFooterView = UIView()
        tableView.theme_backgroundColor = themeBackgroundColors
        tableView.rowHeight = 100
        getBooks()
        upgradeBooks()
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.flatBlack()
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.upgradeBooks()
            self?.tableView.reloadData()
            self?.tableView.dg_stopLoading()
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 205/255.0, green: 233/255.0, blue: 247/255.0, alpha: 0.9))
        tableView.dg_setPullToRefreshBackgroundColor(view.backgroundColor!)
    }

    override func viewWillAppear(_ animated: Bool) {
        getBooks()
    }
    func getBooks() -> Void {
        books = SavedModalController.getBookInfos()
        tableView.reloadData()
    }
    
    func upgradeBooks() -> Void{
        let reached = Reachability()
        if reached?.connection == Reachability.Connection.none {
            DispatchQueue.main.async {
                HUD.flash(.labeledError(title: "网络错误", subtitle: "请更改网络状态重试"), delay: 1.0)
            }
            return
        }
        for i in books{
            connectService.getBookInformation(sender: self, bookId: i.id!){
                (data,response,error) in
                if error != nil{
                    fatalError("更新是网络错误")
                }
                else{
                    let decoder = JSONDecoder()
                    //print(response)
                    if let json = try? decoder.decode(BookDetailItem.self, from: data!){
                        //print(json)
                        i.image = json.cover
                        i.latestTitle = json.lastChapter
                        i.name = json.title
                        SavedModalController.contextSave()
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
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
        if segue.identifier == "showReader"{
            let reader = segue.destination as! BookReaderViewController
            if selectId == nil{
                fatalError("未发送bookId")
            }
            reader.bookId = selectId!
        }
    }
    
    @IBAction func swipeMenu() -> Void{
        performSegue(withIdentifier: "PresentMenu", sender: self)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectId = books[indexPath.row].id
        self.performSegue(withIdentifier: "showReader", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookcaseTableViewCell") as? BookcaseTableViewCell
        cell?.bookName.text = books[indexPath.row].name
        cell?.latestChapter.text = books[indexPath.row].latestTitle
        connectService.getImage(sender: self, urlstring: books[indexPath.row].image!){(data,response,error) in
            if error != nil{
                //fatalError("更新是网络错误")
            }
            else{
                DispatchQueue.main.async {
                    cell?.bookImage.image = UIImage.init(data: data!)
                }
            }
            
        }
        cell?.theme_backgroundColor = themeCellColors
        return cell!
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            SavedModalController.deleteObject(obj: self.books[indexPath.row])
            self.books.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
}
