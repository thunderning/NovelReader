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
    
    var chapters:[ChapterType?] = []
    var links:ChapterListItem? = nil
    var currentChapter:Int = 1
    var bookSourceId:String = ""
    var bookId:String = ""
    var font:UIFont = UIFont.systemFont(ofSize: 22)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.font = font
        setBookId(bookId: "50bff3ec209793513100001c")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setFont(font:UIFont) -> Void {
        contentView.font = font
        
    }
    
    func setBookId(bookId:String) -> Void {
        if self.bookId != bookId{
            self.bookId = bookId
            let s = DispatchSemaphore(value: 0)
            ConnectService().getChapterListByBook(sender: self, bookId: bookId){ (data,response,error) in
                if error != nil{
                    print(error)
                }
                else{
                    let decoder = JSONDecoder()
                    print(response)
                    if let json = try? decoder.decode(ChapterListItem.self, from: data!){
                        print(json)
                        self.links = json
                        self.chapters = Array.init(repeating: nil, count: json.mixToc.chapters.count)
                    }
                }
                s.signal()
            }
            s.wait()
            setCurrentChapter(currentChapter: 0)
        }
    }
    
    func setCurrentChapter(_ currentPage:Int = 0,currentChapter:Int) -> Void {
        self.currentChapter = currentChapter
        if chapters[currentChapter] == nil {
            let date = Date()
            chapters[currentChapter] = ChapterType(sender: self, link: (links?.mixToc.chapters[currentChapter].link)!, font: font)
            let millionSecond = NSDate().timeIntervalSince(date)
            print("下载第\(currentChapter+1)章花费\(millionSecond)s")
        }
        let c = chapters[currentChapter]
        contentView.text = c?.content[currentPage]
        pagesView.pagesCount = (c?.content.count)!
        pagesView.currentPage = currentPage + 1
        pagesView.update()
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
