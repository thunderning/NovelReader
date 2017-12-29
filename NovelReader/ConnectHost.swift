//
//  ConnectHost.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/24.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
import UIKit

class ConnectService: NSObject {
    let session:URLSession
    override init() {
        //super.init()
        let acceptEncoding: String = "gzip;q=1.0, compress;q=0.5"
        let acceptLanguage = Locale.preferredLanguages.prefix(6).enumerated().map { index, languageCode in
            let quality = 1.0 - (Double(index) * 0.1)
            return "\(languageCode);q=\(quality)"
            }.joined(separator: ", ")
        let configuration = URLSessionConfiguration.default
        //修改user_agent，不知道为何使用默认会导致某些api错误
        configuration.httpAdditionalHeaders = [
            "Accept-Encoding": acceptEncoding,
            "Accept-Language": acceptLanguage,
            "User-Agent": "Thunderning"
        ]
        session = URLSession(configuration: configuration)
    }
    func startService(sender:UIViewController,urlstr:String, completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void){
        let url: URL = URL(string:urlstr)!
        //2.获得会话对象
        //3.根据会话对象创建一个Task(发送请求）
        /*
         第一个参数：请求路径
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         注意：
         1）该方法内部会自动将请求路径包装成一个请求对象，该请求对象默认包含了请求头信息和请求方法（GET）
         2）如果要发送的是POST请求，则不能使用该方法
         */
        let dataTask: URLSessionDataTask = session.dataTask(with: url, completionHandler: completionHandler)
        dataTask.resume()
    }
    //获取全部分类（带书籍数量）
    func getAllCats(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
    }
    //获取某分类的书籍列表
    func getCatBooks(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //根据性别获取排行榜id
    func getRanksByGender(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //根据排行榜id获取排行榜书籍列表
    func getRankBooks(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //获取书单列表
    func getBookLists(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //根据书单id获取书单信息
    func getBookListBooks(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //获取搜索热词
    func getHotKey(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //搜索自动补全
    func getAutoCompletion(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //模糊搜索
    func getSearchResult(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //精确搜索
    func getAccurateSearch(sender:UIViewController,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        
    }
    //获取小说信息
    func getBookInformation(sender:UIViewController,bookId:String,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        print(API_URL + "book/\(bookId)")
        startService(sender: sender, urlstr: API_URL + "book/\(bookId)", completionHandler: completionHandler)
    }
    //获取小说源列表
    func getBookSources(sender:UIViewController,bookId:String,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        //print(API_URL + "mix-atoc/\(bookId)?view=chapters")
        startService(sender: sender, urlstr: API_URL + "atoc?book=\(bookId)&view=summary", completionHandler: completionHandler)
    }
    //获取小说章节列表（根据小说id）
    func getChapterListByBook(sender:UIViewController,bookId:String,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        //print(API_URL + "mix-atoc/\(bookId)?view=chapters")
        startService(sender: sender, urlstr: API_URL + "mix-atoc/\(bookId)?view=chapters", completionHandler: completionHandler)
    }
    //获取小说章节列表（根据小说源id）
    func getChapterListByBookSource(sender:UIViewController,bookSourceId:String,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
       
        startService(sender: sender, urlstr: API_URL + "atoc/\(bookSourceId)?view=chapters", completionHandler: completionHandler)
    }
    //获取小说章节内容
    func getChapterContent(sender:UIViewController,link:String,completionHandler:@escaping (_ data:Data?,_ response:URLResponse?,_ error:Error?) -> Void) -> Void {
        var l = link.replacingOccurrences(of: ":", with: "%3A")
        l = l.replacingOccurrences(of: "/", with: "%2F")
        l = l.replacingOccurrences(of: "?", with: "%3F")
        l = l.replacingOccurrences(of: "=", with: "%3D")
        l = l.replacingOccurrences(of: "&", with: "%26")
        startService(sender: sender, urlstr: CHAPTER_URL + l, completionHandler: completionHandler)
    }
}
