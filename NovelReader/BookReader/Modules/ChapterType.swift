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
    var link:String? = nil
    var content:[String] = []
    var title:String = ""
    var string:String = ""
    var attributedKey:[NSAttributedStringKey:Any]
    let width = UIScreen.main.bounds.width - 20
    let height = UIScreen.main.bounds.height - 25 - 25
    init(sender:UIViewController, link:String , title:String , attributedKey:[NSAttributedStringKey:Any] ){
        self.link = link
        self.title = title
        let font = (attributedKey[NSAttributedStringKey.font] as! UIFont).copy()
        let paragragh = (attributedKey[NSAttributedStringKey.paragraphStyle] as! NSParagraphStyle).copy()
        self.attributedKey = [NSAttributedStringKey.font:font , NSAttributedStringKey.paragraphStyle:paragragh]
        print(link)
        super.init()
        self.getContentString(sender: sender)
        self.splitContentString()
    }
    init(sender:UIViewController, string:String , title:String , attributedKey:[NSAttributedStringKey:Any] ){
        //self.link = link
        self.title = title
        self.string = string
        let font = (attributedKey[NSAttributedStringKey.font] as! UIFont).copy()
        let paragragh = (attributedKey[NSAttributedStringKey.paragraphStyle] as! NSParagraphStyle).copy()
        self.attributedKey = [NSAttributedStringKey.font:font , NSAttributedStringKey.paragraphStyle:paragragh]
        super.init()
        self.splitContentString()
    }
    func getContentString(sender:UIViewController) -> Void {
        let semaphore = DispatchSemaphore(value: 0)
        connectService.getChapterContent(sender: sender, link: link!){ (data, response, error)  in
            //TODO:缺少错误提示
            if error != nil{
                print(error)
            }
            else{
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(ChapterItem.self, from: data!){
                    //print(json)
                    if json.ok {
                        //self.title = json.chapter.title
                        self.string = json.chapter.body
                    }
                }
            }
            
            semaphore.signal()
        }
        semaphore.wait()
    }
    
    func checkAttributedKey(attributedKey:[NSAttributedStringKey:Any]) -> Void {
        if ((self.attributedKey[NSAttributedStringKey.font] as! UIFont) == (attributedKey[NSAttributedStringKey.font] as! UIFont)) && ((self.attributedKey[NSAttributedStringKey.paragraphStyle] as! NSParagraphStyle) == (attributedKey[NSAttributedStringKey.paragraphStyle] as! NSParagraphStyle)) {
            return
        }
        else {
            let font = (attributedKey[NSAttributedStringKey.font] as! UIFont).copy()
            let paragragh = (attributedKey[NSAttributedStringKey.paragraphStyle] as! NSParagraphStyle).copy()
            self.attributedKey = [NSAttributedStringKey.font:font , NSAttributedStringKey.paragraphStyle:paragragh]
            splitContentString()
        }
    }
    
    func splitContentString() -> Void {
        content.removeAll()
        string = string.replacingOccurrences(of: " ", with: "")
        string = string.replacingOccurrences(of: "\t", with: "")
        string = string.replacingOccurrences(of: "\n", with: "\n\t")
        var temp = string
        while temp != "" {
            let i = findFirstPage(temp)
            content.append(String(temp[..<String.Index.init(encodedOffset: i)]))
            temp = String(temp[String.Index.init(encodedOffset: i)...]).trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    //用二分法查找第一页
    func findFirstPage(_ string:String) -> Int {
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
            if a.heightWithFont(attributedKey: attributedKey,fixedWidth: width) >= height{
                if b.heightWithFont(attributedKey: attributedKey ,fixedWidth: width) < height{
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
    
    func heightWithFont(attributedKey:[NSAttributedStringKey:Any], fixedWidth : CGFloat) -> CGFloat {
    
        guard self.count > 0 && fixedWidth > 0 else {
            
            return 0
        }
        
        let size = CGSize(width: fixedWidth, height: CGFloat(10000))
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributedKey, context:nil)
        return rect.size.height
    }
    
}
