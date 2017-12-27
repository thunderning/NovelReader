//
//  BookReaderViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/21.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit

class BookReaderViewController: UIViewController {
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var settingBar: SettingView!
    
    
    
    var chapters:[ChapterType?] = []
    var links:ChapterListItem? = nil
    var currentChapter:Int = 0
    var currentPage:Int = 0
    var bookSourceId:String = ""
    var bookId:String = ""
    var bookName:String = "六道封神"
    var attributedKey:[NSAttributedStringKey:Any] = [:]
    let pagesController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
    var isMenuShow:Bool = false
    var isSettingShow:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let font:UIFont = UIFont.systemFont(ofSize: 22)
        let paragraghStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraghStyle.lineSpacing = 3
        attributedKey = [NSAttributedStringKey.font:font , NSAttributedStringKey.paragraphStyle:paragraghStyle]
        device.isBatteryMonitoringEnabled = true
        pagesController.view.frame = self.view.frame
        pagesController.dataSource = self
        pagesController.delegate = self
        self.addChildViewController(pagesController)
        self.view.addSubview(self.pagesController.view)
        self.view.sendSubview(toBack: self.pagesController.view)
        setBookId(bookId: "57bad28103650d4213a34cdc")
        
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
                    print(response)
                    if let json = try? decoder.decode(ChapterListItem.self, from: data!){
                        //print(json)
                        self.links = json
                        self.chapters = Array.init(repeating: nil, count: json.mixToc.chapters.count)
                    }
                }
                s.signal()
            }
            s.wait()
            titleLabel.text = bookName
            setCurrentChapter(0)
            setCurrentPage(0)
        }
    }
    
    func setCurrentChapter(_ currentChapter:Int) -> Void {
        self.currentChapter = currentChapter
        //若章节缺失，则从api获取
        if chapters[currentChapter] == nil {
            let date = Date()
            chapters[currentChapter] = ChapterType(sender: self, link: (links?.mixToc.chapters[currentChapter].link)!,title:(links?.mixToc.chapters[currentChapter].title)!, attributedKey:attributedKey)
            let millionSecond = NSDate().timeIntervalSince(date)
            print("下载第\(currentChapter+1)章花费\(millionSecond)s")
        }
        else{
            chapters[currentChapter]?.checkAttributedKey(attributedKey: attributedKey)
        }
    }
    
    func setCurrentPage(_ currentPage:Int = 0) -> Void{
        self.currentPage = currentPage
        if let page = pagesController.presentedViewController as? PageViewController{
             page.setContent(chapter: chapters[currentChapter]!, currentPage: currentPage, attributedKey: attributedKey)
        }
        else{
            let page = getPageControllerByCurrentPage(currentPage)
            pagesController.setViewControllers([page], direction: .forward, animated: false, completion: nil)
        }
    }
    
    func getPageControllerByCurrentPage(_ currentPage:Int = 0) -> PageViewController {
        self.currentPage = currentPage
        let page = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
        page.loadView()
        page.setContent(chapter: chapters[currentChapter]!, currentPage: currentPage, attributedKey: attributedKey)
        return page
    }
    //显示/隐藏菜单
    @IBAction func tapClick(){
        //print("按钮被点击")
        if isSettingShow{
            isSettingShow = !isSettingShow
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [], animations: {() in
                self.settingBar.frame = self.settingBar.frame.offsetBy(dx: 0, dy: (self.settingBar.frame.height + 10 + self.bottomBar.frame.height))
            })
        }
        else{
            isMenuShow = !isMenuShow
            if isMenuShow {
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [], animations: {() in
                    self.topBar.frame = self.topBar.frame.offsetBy(dx: 0, dy: self.topBar.frame.height)
                    self.bottomBar.frame = self.bottomBar.frame.offsetBy(dx: 0, dy: -self.bottomBar.frame.height)
                })
            }
            else{
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [], animations: {() in
                    self.topBar.frame = self.topBar.frame.offsetBy(dx: 0, dy: -self.topBar.frame.height)
                    self.bottomBar.frame = self.bottomBar.frame.offsetBy(dx: 0, dy: self.bottomBar.frame.height)
                })
            }
        }
        
    }
    
    @IBAction func settingTapped(){
        isSettingShow = !isSettingShow
        if isSettingShow{
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [], animations: {() in
                self.settingBar.frame = self.settingBar.frame.offsetBy(dx: 0, dy: -(self.settingBar.frame.height + 10 + self.bottomBar.frame.height))
            })
        }
        else{
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [], animations: {() in
                self.settingBar.frame = self.settingBar.frame.offsetBy(dx: 0, dy: (self.settingBar.frame.height + 10 + self.bottomBar.frame.height))
            })
        }
    }
    
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool{
        return true
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

extension BookReaderViewController : UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if currentPage == 0 {
            if currentChapter != 0 {
                setCurrentChapter(currentChapter - 1)
                return getPageControllerByCurrentPage((chapters[currentChapter]?.content.count)! - 1)
            }
            else{
                return nil
            }
        }
        else{
            return getPageControllerByCurrentPage(currentPage - 1)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if currentPage == (chapters[currentChapter]?.content.count)! - 1 {
            if currentChapter != chapters.count - 1{
                setCurrentChapter(currentChapter + 1)
                return getPageControllerByCurrentPage(0)
            }
            else{
                return nil
            }
        }
        else{
            return getPageControllerByCurrentPage(currentPage + 1)
        }

    }
    
    
}
