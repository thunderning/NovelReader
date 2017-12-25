//
//  ChapterItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/22.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
import UIKit
class ChapterType: NSObject {
    var link:String
    var content:[String] = []
    var title:String = ""
    var string:String = ""
    let width = UIScreen.main.bounds.width - 20
    let height = UIScreen.main.bounds.height - 20 - 20 - 25
    init(sender:UIViewController, link:String , font:UIFont){
        self.link = link
        print(link)
        super.init()
        self.getContentString(sender: sender)
        self.getContent(font)
    }
    func getContentString(sender:UIViewController) -> Void {
        let semaphore = DispatchSemaphore(value: 0)
        ConnectService().getChapterContent(sender: sender, link: link){ (data, response, error)  in
            //TODO:缺少错误提示
            if error != nil{
                print(error)
            }
            else{
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(ChapterItem.self, from: data!){
                    //print(json)
                    if json.ok {
                        self.title = json.chapter.title
                        self.string = json.chapter.body
                    }
                }
            }
            
            semaphore.signal()
        }
        semaphore.wait()
    }
    func getContent(_ font : UIFont) -> Void {
        string = string.replacingOccurrences(of: "\t", with: "")
        while string != "" {
            let i = findFirstPage(string,font)
            content.append(String(string[..<String.Index.init(encodedOffset: i)]))
            string = String(string[String.Index.init(encodedOffset: i)...])
        }
    }
    //用二分法查找第一页
    func findFirstPage(_ string:String,_ font:UIFont) -> Int {
//        for i in string.enumerated() {
//            let a = String(string[..<String.Index.init(encodedOffset: i.offset+1)])
//            if a.heightWithFont(fixedWidth: width) >= height{
//                //print(String(string[..<String.Index.init(encodedOffset: i.offset)]).heightWithFont(fixedWidth: width))
//                return i.offset
//            }
//        }
        var left = 0
        var right = string.count - 1
        var mid = (left+right)/2
        while left <= right {
            let a = String(string[..<String.Index.init(encodedOffset: mid+1)])
            let b = String(string[..<String.Index.init(encodedOffset: mid)])
            if a.heightWithFont(font: font,fixedWidth: width) >= height{
                if b.heightWithFont(font: font ,fixedWidth: width) < height{
                    return mid
                }
                else {
                    right = mid - 1
                }
            }
            else {
                left = mid + 1
            }
            mid = (left + right)/2
        }
        return string.count
    }
}

extension String {
    
    func heightWithFont(font : UIFont = UIFont.systemFont(ofSize: 18), fixedWidth : CGFloat) -> CGFloat {
        
        guard self.count > 0 && fixedWidth > 0 else {
            
            return 0
        }
        
        let size = CGSize(width: fixedWidth, height: CGFloat(10000))
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : font], context:nil)
        return rect.size.height
    }
    
}
