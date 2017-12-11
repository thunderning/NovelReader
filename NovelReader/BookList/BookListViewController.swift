//
//  BookListViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/10.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit
import Chameleon

class BookListViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    var bookLists:BookListsItem? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        getBookLists()
        tableView.backgroundColor = UIColor.flatWhiteColorDark()
        tableView.tableFooterView = UIView()
        view.backgroundColor = UIColor.flatWhiteColorDark().lighten(byPercentage: 0.2)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getBookLists() -> Void {
        bookLists = BookListsItem(total: 123, bookLists: [BookListItem(_id: "", title: "自己看", author: "wo", desc: "hahahahha", cover: "", collectorCount: 123, bookCount: 321)])
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

extension BookListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (bookLists?.bookLists.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookListTableViewCell") as? BookListTableViewCell
        let booklist = bookLists?.bookLists[indexPath.row]
        cell?.listAuthor.text = booklist?.author
        cell?.listTitle.text = booklist?.title
        cell?.listIntro.text = booklist?.desc
        cell?.listFollower.text = "共\(booklist!.bookCount)本书 | \(booklist!.collectorCount)人收藏"
        cell?.backgroundColor = UIColor.flatWhite()
        return cell!
    }
    
    
}
