//
//  BookDetailViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2018/1/1.
//  Copyright © 2018年 吴佳玮. All rights reserved.
//

import UIKit
import PKHUD

class BookDetailViewController: UITableViewController {
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var authorView: UILabel!
    @IBOutlet weak var rateView: UILabel!
    @IBOutlet weak var countView: UILabel!
    @IBOutlet weak var latestChapterView: UILabel!
    @IBOutlet weak var followerView: UILabel!
    @IBOutlet weak var retentionRatioView: UILabel!
    @IBOutlet weak var dailyWordView: UILabel!
    @IBOutlet weak var longIntroView: UILabel!
    @IBOutlet weak var addOrDeleteButton: SettingButton!
    
    var tagsView:TagsView? = nil
    var bookId:String? = nil
    var isExist:Bool = false
    var detail:BookDetailItem? = nil
    var localBooks:[CoreBookInfo] = SavedModalController.getBookInfos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //bookId = "548d9c17eb0337ee6df738f5"
        self.tableView.theme_backgroundColor = themeCellColors
        self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 0))?.theme_backgroundColor = themeCellColors
        self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 0))?.theme_backgroundColor = themeCellColors
        self.tableView.cellForRow(at: IndexPath.init(row: 2, section: 0))?.theme_backgroundColor = themeCellColors
        self.tableView.cellForRow(at: IndexPath.init(row: 1, section: 0))?.theme_backgroundColor = themeCellColors
        self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0))?.theme_backgroundColor = themeCellColors
        tagsView = TagsView.init(frame: CGRect.init(x: 16, y: 10, width: UIScreen.main.bounds.width - 32, height: 80))
        connectService.getBookInformation(sender: self, bookId: self.bookId!){
            (data,response,error) in
            if error != nil{
                DispatchQueue.main.async {
                    HUD.flash(.labeledError(title: "网络错误", subtitle: "请更改网络状态重试"), delay: 1)
                }
            }
            else{
                let decoder = JSONDecoder()
                //print(response)
                if let json = try? decoder.decode(BookDetailItem.self, from: data!){
                    //print(json)
                    self.detail = json
                    //设置图片
                    connectService.getImage(sender: self, urlstring: json.cover){
                        (data,response,error) in
                        if error != nil{
                            //fatalError("更新是网络错误")
                        }
                        else{
                            DispatchQueue.main.async {
                                self.bookImage.image = UIImage.init(data: data!)
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.title = json.title
                        self.titleView.text = json.title
                        self.authorView.text = json.author
                        self.rateView.text = "\(json.rating.score)分 | \(json.rating.count)人评"
                        if json.isSerial {
                            self.countView.text = "\(json.wordCount/10000)万字 | 连载中"
                        }
                        else{
                            self.countView.text = "\(json.wordCount/10000)万字 | 完本"
                        }
                        self.latestChapterView.text = json.lastChapter
                        self.followerView.text = "\(json.latelyFollower)"
                        self.retentionRatioView.text = "\(json.retentionRatio)%"
                        self.dailyWordView.text = "\(json.serializeWordCount)"
                        self.longIntroView.text = "\(json.longIntro)"
                        for i in json.tags{
                            self.tagsView?.addTag(str: i)
                        }
                        let t = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 0))
                        t?.contentView.addSubview(self.tagsView!)
                        for j in self.localBooks{
                            if j.id == json._id{
                                self.isExist = true
                                break
                            }
                        }
                        self.changeAddOrDelete()
                    }
                }
                else{
                    DispatchQueue.main.async {
                        HUD.flash(.labeledError(title: "服务器编码错误", subtitle: nil), delay: 1)
                    }
                }
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func changeAddOrDelete() -> Void {
        if isExist {
            self.addOrDeleteButton.setImage( #imageLiteral(resourceName: "移除"), for: .normal)
            self.addOrDeleteButton.setTitle("从书架移除", for: .normal)
        }
        else{
            self.addOrDeleteButton.setImage( #imageLiteral(resourceName: "添加"), for: .normal)
            self.addOrDeleteButton.setTitle("添加到书架", for: .normal)
        }
    }
    
    @IBAction func addOrDelete() -> Void {
        if isExist {
            for i in localBooks.enumerated(){
                if i.element.id == bookId {
                    SavedModalController.deleteObject(obj: i.element)
                    localBooks.remove(at: i.offset)
                    break
                }
            }
        }
        else{
            SavedModalController.addBookInfo(bookId: (detail?._id)!, name: (detail?.title)!, latestTitle: (detail?.lastChapter)!, sourceId: nil, currentChapter: Int32(0),image: (detail?.cover)!)
        }
        isExist = !isExist
        changeAddOrDelete()
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
        return 5
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
