//
//  BookRankDetailTableViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2018/1/1.
//  Copyright © 2018年 吴佳玮. All rights reserved.
//

import UIKit
import PKHUD

class BookRankDetailTableViewController: UITableViewController {
    
    var books:[BookRankDetailItem] = []
    var rankId:String = ""
    var selectBook:Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        tableView.theme_backgroundColor = themeBackgroundColors
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.flatBlack()
        upgradeBooksAsyn()
        
        //由于navigation bar 的问题， 暂时取消刷新功能
//        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
//            self?.upgradeBooksSyn()
//            self?.tableView.reloadData()
//            self?.tableView.dg_stopLoading()
//            }, loadingView: loadingView)
//        tableView.dg_setPullToRefreshFillColor(UIColor(red: 205/255.0, green: 233/255.0, blue: 247/255.0, alpha: 0.9))
//        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    func upgradeBooksAsyn() -> Void {
        connectService.getRankBooks(sender: self, rankId: rankId){ (data,response,error) in
            if error != nil{
                DispatchQueue.main.async {
                    HUD.flash(.labeledError(title: "网络错误", subtitle: "请更改网络状态重试"), delay: 1.0)
                }
            }
            else{
                let decoder = JSONDecoder()
                //print(response)
                if let json = try? decoder.decode(BookRankDetailItems.self, from: data!){
                    //print(json)
                    self.books = json.ranking.books
                    DispatchQueue.main.async {
                        self.title = json.ranking.title
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
    func upgradeBooksSyn() -> Void {
        let s = DispatchSemaphore(value: 0)
        connectService.getRankBooks(sender: self, rankId: rankId){ (data,response,error) in
            if error != nil{
                DispatchQueue.main.async {
                    HUD.flash(.labeledError(title: "网络错误", subtitle: "请更改网络状态重试"), delay: 1.0)
                }
            }
            else{
                let decoder = JSONDecoder()
                //print(response)
                if let json = try? decoder.decode(BookRankDetailItems.self, from: data!){
                    //print(json)
                    self.books = json.ranking.books
                    DispatchQueue.main.async {
                        self.title = json.ranking.title
                        self.tableView.reloadData()
                    }
                }
                else{
                    DispatchQueue.main.async {
                        HUD.flash(.labeledError(title: "服务器编码错误", subtitle: nil), delay: 1)
                    }
                }
            }
            s.signal()
        }
        s.wait()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookRankDetailTableViewCell", for: indexPath) as! BookRankDetailTableViewCell
        let book = books[indexPath.row]
        cell.titleView.text = book.title
        cell.authorAndCatsView.text = "\(book.author) | \(book.majorCate) | \(book.minorCate)"
        cell.introView.text = book.shortIntro
        cell.followerView.text = "\(book.latelyFollower)人在追 | \(book.retentionRatio)%留存"
        connectService.getImage(sender: self, urlstring: book.cover){(data,response,error) in
            if error != nil{
                //fatalError("更新是网络错误")
            }
            else{
                DispatchQueue.main.async {
                    cell.bookImageView.image = UIImage.init(data: data!)
                }
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectBook = indexPath.row
        self.performSegue(withIdentifier: "showBookDetail", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetail" {
            let vc = segue.destination as! BookDetailViewController
            vc.bookId = books[selectBook!]._id
        }
    }

}
