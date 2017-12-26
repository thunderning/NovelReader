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
    var currentChapter:Int = 0
    var currentPage:Int = 0
    var bookSourceId:String = ""
    var bookId:String = ""
    var attributedKey:[NSAttributedStringKey:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //contentView.font = font
        let font:UIFont = UIFont.systemFont(ofSize: 22)
        let paragraghStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraghStyle.lineSpacing = 3
        attributedKey = [NSAttributedStringKey.font:font , NSAttributedStringKey.paragraphStyle:paragraghStyle]
        device.isBatteryMonitoringEnabled = true
        setBookId(bookId: "50bff3ec209793513100001c")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setFont(font:UIFont) -> Void {
        attributedKey[NSAttributedStringKey.font] = font
        chapters[currentChapter]?.checkAttributedKey(attributedKey: attributedKey)
        setCurrentPage(currentPage)
    }
    
    func setLineSpacing(lineSpacing:CGFloat) -> Void {
        let t = attributedKey[NSAttributedStringKey.paragraphStyle] as! NSMutableParagraphStyle
        t.lineSpacing = lineSpacing
        chapters[currentChapter]?.checkAttributedKey(attributedKey: attributedKey)
        setCurrentPage(currentPage)
    }
    
    func setBookId(bookId:String) -> Void {
        if self.bookId != bookId{
            self.bookId = bookId
            let s = DispatchSemaphore(value: 0)
            connectService.getChapterListByBook(sender: self, bookId: bookId){ (data,response,error) in
                if error != nil{
                    print(error)
                }
                else{
                    let decoder = JSONDecoder()
                    //print(response)
                    if let json = try? decoder.decode(ChapterListItem.self, from: data!){
                        //print(json)
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
        //若章节缺失，则从api获取
        if chapters[currentChapter] == nil {
            let date = Date()
            chapters[currentChapter] = ChapterType(sender: self, link: (links?.mixToc.chapters[currentChapter].link)!, attributedKey:attributedKey)
            let millionSecond = NSDate().timeIntervalSince(date)
            print("下载第\(currentChapter+1)章花费\(millionSecond)s")
        }
        titleView.text = chapters[currentChapter]?.title
        pagesView.pagesCount = (chapters[currentChapter]?.content.count)!
        setCurrentPage(currentPage)
    }
    
    func setCurrentPage(_ currentPage:Int = 0) -> Void{
        if currentPage < (chapters[currentChapter]?.content.count)! {
            self.currentPage = currentPage
        }
        else{
            self.currentPage = 0
        }
        let c = chapters[self.currentChapter]
        contentView.attributedText = NSAttributedString.init(string: (c?.content[self.currentPage])!, attributes: attributedKey)
        pagesView.currentPage = self.currentPage + 1
        pagesView.update()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeView.text = formatter.string(from: Date())
        batteryView.level = Int(device.batteryLevel*100)
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
