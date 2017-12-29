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
    
//    var chapters:[ChapterType?] = []
//    var links:ChapterListItem? = nil
//    var currentChapter:Int = 0
//    var currentPage:Int = 0
//    var bookSourceId:String = ""
//    var bookId:String = ""
//    var attributedKey:[NSAttributedStringKey:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setContent(chapter:ChapterType,currentPage:Int,attributedKey:[NSAttributedStringKey:Any]) -> Void {
        var cp:Int = 0
        if currentPage < (chapter.content.count) {
            cp = currentPage
        }
        else{
            print("当前页超出范围！！！！")
        }
        contentView.attributedText = NSAttributedString.init(string: (chapter.content[cp]), attributes: attributedKey)
        titleView.text = chapter.title
        pagesView.currentPage = cp + 1
        pagesView.pagesCount = chapter.content.count
        pagesView.update()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeView.text = formatter.string(from: Date())
        batteryView.level = Int(device.batteryLevel*100)
    }
    func setTheme(backgroundColor:UIColor,isNight:Bool) -> Void {
        if !isNight {
            self.view.backgroundColor = backgroundColor
            self.batteryView.borderColor = UIColor.black
            self.titleView.textColor = UIColor.darkGray
            self.contentView.textColor = UIColor.black
            self.timeView.textColor = UIColor.darkGray
            self.pagesView.textColor = UIColor.darkGray
        }
        else {
            self.view.backgroundColor = UIColor.flatNavyBlueColorDark()
            self.contentView.textColor = UIColor.init(hexString: "#BFD2C7")
            //self.contentView.textColor = UIColor.init(hexString: "#A1A5A7")
            self.batteryView.borderColor = UIColor.init(hexString: "#BFC5C5")
            self.titleView.textColor = UIColor.init(hexString: "#BFC5C5")
            self.timeView.textColor = UIColor.init(hexString: "#BFC5C5")
            self.pagesView.textColor = UIColor.init(hexString: "#BFC5C5")
        }
    }
    
//    func setFont(font:UIFont) -> Void {
//        attributedKey[NSAttributedStringKey.font] = font
//        chapters[currentChapter]?.checkAttributedKey(attributedKey: attributedKey)
//        setCurrentPage(currentPage)
//    }
//
//    func setLineSpacing(lineSpacing:CGFloat) -> Void {
//        let t = attributedKey[NSAttributedStringKey.paragraphStyle] as! NSMutableParagraphStyle
//        t.lineSpacing = lineSpacing
//        chapters[currentChapter]?.checkAttributedKey(attributedKey: attributedKey)
//        setCurrentPage(currentPage)
//    }
//
//    func setBookId(bookId:String) -> Void {
//        if self.bookId != bookId{
//            self.bookId = bookId
//            let s = DispatchSemaphore(value: 0)
//            connectService.getChapterListByBook(sender: self, bookId: bookId){ (data,response,error) in
//                if error != nil{
//                    print(error)
//                }
//                else{
//                    let decoder = JSONDecoder()
//                    //print(response)
//                    if let json = try? decoder.decode(ChapterListItem.self, from: data!){
//                        //print(json)
//                        self.links = json
//                        self.chapters = Array.init(repeating: nil, count: json.mixToc.chapters.count)
//                    }
//                }
//                s.signal()
//            }
//            s.wait()
//            setCurrentChapter(currentChapter: 0)
//        }
//    }
//
//    func setCurrentChapter(_ currentPage:Int = 0,currentChapter:Int) -> Void {
//        self.currentChapter = currentChapter
//        //若章节缺失，则从api获取
//        if chapters[currentChapter] == nil {
//            let date = Date()
//            chapters[currentChapter] = ChapterType(sender: self, link: (links?.mixToc.chapters[currentChapter].link)!, attributedKey:attributedKey)
//            let millionSecond = NSDate().timeIntervalSince(date)
//            print("下载第\(currentChapter+1)章花费\(millionSecond)s")
//        }
//        titleView.text = chapters[currentChapter]?.title
//        pagesView.pagesCount = (chapters[currentChapter]?.content.count)!
//        setCurrentPage(currentPage)
//    }
//
//    func setCurrentPage(_ currentPage:Int = 0) -> Void{
//        if currentPage < (chapters[currentChapter]?.content.count)! {
//            self.currentPage = currentPage
//        }
//        else{
//            self.currentPage = 0
//        }
//        let c = chapters[self.currentChapter]
//        contentView.attributedText = NSAttributedString.init(string: (c?.content[self.currentPage])!, attributes: attributedKey)
//        pagesView.currentPage = self.currentPage + 1
//        pagesView.update()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm"
//        timeView.text = formatter.string(from: Date())
//        batteryView.level = Int(device.batteryLevel*100)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
