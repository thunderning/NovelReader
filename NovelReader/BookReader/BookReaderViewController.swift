//
//  BookReaderViewController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/21.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import UIKit

class BookReaderViewController: UIViewController {
    @IBOutlet weak var nightButton: UIButton!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var settingBar: SettingView!
    @IBOutlet weak var brightnessBar: UISlider!
    
    
    var chapters:[ChapterType?] = []
    var links:[LinkType] = []
    var currentChapter:Int = 0
    var currentPage:Int = 0
    var bookSourceId:String? = nil
    var bookId:String = ""
    var bookName:String = ""
    var attributedKey:[NSAttributedStringKey:Any] = [:]
    let pagesController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
    var isMenuShow:Bool = false
    var isSettingShow:Bool = false
    var isNight = defaultStandard.getUserDefaults(key: ReaderInfo.isNight) as! Bool
    var pageBackColor = UIColor.init(hexString: defaultStandard.getUserDefaults(key: ReaderInfo.backgroundColor) as! String)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化文本相关
        let font:UIFont = UIFont.systemFont(ofSize:CGFloat.init(defaultStandard.getUserDefaults(key: ReaderInfo.fontSize)as! Int))
        let paragraghStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraghStyle.lineSpacing = CGFloat.init(defaultStandard.getUserDefaults(key: ReaderInfo.lineSpacing) as! Int)
        attributedKey = [NSAttributedStringKey.font:font , NSAttributedStringKey.paragraphStyle:paragraghStyle]
        //允许监视电池
        device.isBatteryMonitoringEnabled = true
        //初始化页面管理
        pagesController.view.frame = self.view.frame
        pagesController.dataSource = self
        pagesController.delegate = self
        self.addChildViewController(pagesController)
        self.view.addSubview(self.pagesController.view)
        self.view.sendSubview(toBack: self.pagesController.view)
        //初始化亮度
        brightnessBar.value = Float(UIScreen.main.brightness)
        //夜间/日间 按钮
        changeNightButton()
        //测试
//        SavedModalController.context.delete(SavedModalController.getBookInfos()[0])
//        //print(SavedModalController.getBookInfos())
//        SavedModalController.addBookInfo(bookId: "57bad28103650d4213a34cdc", name: "六界封神", latestTitle: "默认卷 第1891章        找人帮忙", sourceId: nil, currentChapter: 0)
//        print(SavedModalController.getBookInfos())
        setBookId(bookId: "57bad28103650d4213a34cdc")
//        print("===========================================\n")
//        print(SavedModalController.getBookSourceInfos()[0].chapters?.array as! [CoreChapterInfo])
//        print("=============================================")
    }
    func setFont(font:UIFont) -> Void {
        attributedKey[NSAttributedStringKey.font] = font
        defaultStandard.set(font.pointSize, forKey: ReaderInfo.fontSize)
        chapters[currentChapter]?.checkAttributedKey(attributedKey: attributedKey)
        setCurrentPage(currentPage)
    }
    
    func setLineSpacing(lineSpacing:CGFloat) -> Void {
        let t = attributedKey[NSAttributedStringKey.paragraphStyle] as! NSMutableParagraphStyle
        t.lineSpacing = lineSpacing
        defaultStandard.set(lineSpacing, forKey: ReaderInfo.lineSpacing)
        chapters[currentChapter]?.checkAttributedKey(attributedKey: attributedKey)
        setCurrentPage(currentPage)
    }
    
    func setBookId(bookId:String) -> Void {
        if self.bookId != bookId{
            self.bookId = bookId
            let bookInfo = SavedModalController.getBookInfos(bookId: bookId)
            if bookInfo.count == 0 || bookInfo.count > 1{
                fatalError("书籍\(bookId)没有本地信息")
            }
            else{
                self.bookName = bookInfo[0].name!
                self.bookSourceId = bookInfo[0].sourceId
                self.currentChapter = Int(bookInfo[0].currentChapter)
                self.currentPage = 0
                titleLabel.text = bookName
            }
            
            if self.bookSourceId == nil{
                let s1 = DispatchSemaphore(value: 0)
                connectService.getBookSources(sender: self, bookId: bookId){ (data,response,error) in
                    if error != nil{
                        print(error)
                    }
                    else{
                        let decoder = JSONDecoder()
                        print(response)
                        if let json = try? decoder.decode([BookSourceItem].self, from: data!){
                            //print(json)
                            //默认选第二个源，因为第一个为正版源
                            if json.count < 2 {
                                fatalError("无盗版源")
                            }
                            self.bookSourceId = json[1]._id
                            bookInfo[0].sourceId = self.bookSourceId
                            SavedModalController.contextSave()
                        }
                    }
                    s1.signal()
                }
                s1.wait()
            }
            //print(SavedModalController.getBookInfos())
            setBookSourceId(bookSourceId: self.bookSourceId!)
            setCurrentChapter(currentChapter)
            setCurrentPage(currentPage)
        }
    }
    
    func setBookSourceId(bookSourceId:String) -> Void {
        let sourceIdInfo = SavedModalController.getBookSourceInfos(sourceId: bookSourceId)
        self.bookSourceId = bookSourceId
        if sourceIdInfo.count == 0 {
            let s1 = DispatchSemaphore(value: 0)
            connectService.getChapterListByBookSource(sender: self, bookSourceId: bookSourceId){ (data,response,error) in
                if error != nil{
                    print(error)
                }
                else{
                    let decoder = JSONDecoder()
                    print(response)
                    if let json = try? decoder.decode(ChapterListItemAtoc.self, from: data!){
                        //print(json)
                        self.links = json.chapters
                        self.chapters = Array.init(repeating: nil, count: self.links.count)
                        var c:[String?] = []
                        for i in self.chapters{
                            if i == nil{
                                c.append(nil)
                            }
                            else{
                                c.append(i!.string)
                            }
                        }
                        SavedModalController.addBookSourceInfo(sourceId: bookSourceId, links: self.links, content: c)
                    }
                }
                s1.signal()
            }
            s1.wait()
        }
        else{
            self.links = []
            for i in sourceIdInfo[0].chapterList?.array as! [CoreChapterListInfo]{
                self.links.append(LinkType(title: i.title!, link: i.link!))
            }
            self.chapters = []
            for j in sourceIdInfo[0].chapters?.array as! [CoreChapterInfo]{
                if j.content == nil{
                    self.chapters.append(nil)
                }
                else{
                    self.chapters.append(ChapterType(sender: self, string: j.content!, title: self.links[self.chapters.count].title, attributedKey: self.attributedKey))
                }
            }
        }
    }
    
    func setCurrentChapter(_ currentChapter:Int) -> Void {
        self.currentChapter = currentChapter
        //若章节缺失，则从api获取
        if chapters[currentChapter] == nil {
            let date = Date()
            chapters[currentChapter] = ChapterType(sender: self, link: links[currentChapter].link,title:links[currentChapter].title, attributedKey:attributedKey)
            let millionSecond = NSDate().timeIntervalSince(date)
            print("下载第\(currentChapter+1)章花费\(millionSecond)s")
        }
        else{
            chapters[currentChapter]?.checkAttributedKey(attributedKey: attributedKey)
        }
        var c:[String?] = []
        for i in self.chapters{
            if i == nil{
                c.append(nil)
            }
            else{
                c.append(i!.string)
            }
        }
        SavedModalController.updateBookSourceInfo(sourceId: bookSourceId!, links: self.links, content: c)
        let bookInfo = SavedModalController.getBookInfos(bookId: bookId)
        if bookInfo.count == 0 || bookInfo.count > 1{
            fatalError("书籍\(bookId)没有本地信息")
        }
        else{
            bookInfo[0].currentChapter = Int32(currentChapter)
            SavedModalController.contextSave(info: "currentChapter")
        }
    }
    
    func setCurrentPage(_ currentPage:Int = 0) -> Void{
        self.currentPage = currentPage
        if pagesController.childViewControllers.count == 1 {
            let page = pagesController.childViewControllers[0] as! PageViewController
            page.setContent(chapter: chapters[currentChapter]!, currentPage: currentPage, attributedKey: attributedKey)
            page.setTheme(backgroundColor: pageBackColor!, isNight: isNight)
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
        page.setTheme(backgroundColor: pageBackColor!, isNight: isNight)
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
    
    //以下为setting中的行为
    //亮度调节
    @IBAction func sliderDidchange(_ slider:UISlider){
        //print(slider.value)
        UIScreen.main.brightness = CGFloat(slider.value)
    }
    //字体相关
    @IBAction func fontSizeBigger(_ button:UIButton){
        let font = attributedKey[NSAttributedStringKey.font] as! UIFont
        setFont(font: font.withSize(font.pointSize + 1))
    }
    @IBAction func fontSizeSmaller(_ button:UIButton){
        let font = attributedKey[NSAttributedStringKey.font] as! UIFont
        setFont(font: font.withSize(font.pointSize - 1))
    }
    //行间距相关
    @IBAction func lineSpacingSet1(_ button:UIButton){
        setLineSpacing(lineSpacing: 1)
    }
    
    @IBAction func lineSpacingSet3(_ button:UIButton){
        setLineSpacing(lineSpacing: 3)
    }
    
    @IBAction func lineSpacingSet5(_ button:UIButton){
        setLineSpacing(lineSpacing: 5)
    }
    //设置背景色
    @IBAction func setBackgroundColor(_ button:UIButton){
        self.pageBackColor = button.backgroundColor
        let current = pagesController.childViewControllers[0] as! PageViewController
        current.setTheme(backgroundColor: button.backgroundColor!, isNight: isNight)
        defaultStandard.set(pageBackColor?.hexString(false), forKey: ReaderInfo.backgroundColor)
    }
    //夜间模式
    func changeNightButton() -> Void {
        if isNight {
            nightButton.setTitle("日间", for: .normal)
            nightButton.setImage( #imageLiteral(resourceName: "白天"), for: .normal)
        }
        else{
            nightButton.setTitle("夜间", for: .normal)
            nightButton.setImage( #imageLiteral(resourceName: "晚上"), for: .normal)
        }
    }
    @IBAction func setIsNight(_ button:UIButton){
        self.isNight = !isNight
        changeNightButton()
        if isSettingShow {
            tapClick()
        }
        tapClick()
        self.topBar.frame = self.topBar.frame.offsetBy(dx: 0, dy: self.topBar.frame.height)
        self.bottomBar.frame = self.bottomBar.frame.offsetBy(dx: 0, dy: -self.bottomBar.frame.height)
        defaultStandard.set(isNight, forKey: ReaderInfo.isNight)
        let current = pagesController.childViewControllers[0] as! PageViewController
        current.setTheme(backgroundColor: pageBackColor!, isNight: isNight)
        self.view.sendSubview(toBack: self.pagesController.view)
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
            //print(currentPage)
            return getPageControllerByCurrentPage(currentPage + 1)
        }
        
    }
}

