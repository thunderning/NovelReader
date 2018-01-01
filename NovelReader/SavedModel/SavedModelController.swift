//
//  SavedModelController.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/29.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SavedModalController {
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static func contextSave(info:String = "") -> Void{
        do {
            try context.save()
            print("\(info)保存成功！")
        } catch {
            fatalError("不能保存：\(error)")
        }
    }
    static func addBookInfo(bookId:String,name:String,latestTitle:String,sourceId:String?,currentChapter:Int32,image:String) -> Void {
        
        //创建User对象
        let object = NSEntityDescription.insertNewObject(forEntityName: "CoreBookInfo",
                                                       into: context) as! CoreBookInfo
        //对象赋值
        object.currentChapter = currentChapter
        object.id  = bookId
        object.latestTitle = latestTitle
        object.name = name
        object.sourceId = sourceId
        object.image = image
        //保存
        contextSave(info:object.description)
    }
    
    static func getBookInfos(bookId:String? = nil) -> [CoreBookInfo] {
        let fetchRequest:NSFetchRequest<CoreBookInfo> = CoreBookInfo.fetchRequest()
        var ret:[CoreBookInfo] = []
        if bookId != nil {
            fetchRequest.predicate = NSPredicate.init(format: "id = '\(bookId!)'")
        }
        do {
            ret = try context.fetch(fetchRequest)
        } catch {
            fatalError("不能fetch：\(error)")
        }
        return ret
    }
    
    static func getBookSourceInfos(sourceId:String? = nil) -> [CoreBookSourceInfo] {
        let fetchRequest:NSFetchRequest<CoreBookSourceInfo> = CoreBookSourceInfo.fetchRequest()
        var ret:[CoreBookSourceInfo] = []
        if sourceId != nil {
            fetchRequest.predicate = NSPredicate.init(format: "id = '\(sourceId!)'")
        }
        do {
            ret = try context.fetch(fetchRequest)
        } catch {
            fatalError("不能fetch：\(error)")
        }
        return ret
    }
    
    static func addBookSourceInfo(sourceId:String,links:[LinkType],content:[String?]) -> Void {
        
        //创建User对象
        let object = NSEntityDescription.insertNewObject(forEntityName: "CoreBookSourceInfo",
                                                         into: context) as! CoreBookSourceInfo
        //对象赋值
        object.id = sourceId
        var chapterListArray:[CoreChapterListInfo] = []
        for i in links{
            chapterListArray.append(addChapterListInfo(linkType: i))
        }
        object.chapterList = NSOrderedSet.init(array: chapterListArray)
        var chapterArray:[CoreChapterInfo] = []
        for j in content{
            chapterArray.append(addChapterInfo(content: j))
        }
        object.chapters = NSOrderedSet.init(array: chapterArray)
        //保存
        contextSave(info:"创建书源\(object.id!)")
    }
    
    static  func addChapterListInfo(linkType:LinkType) -> CoreChapterListInfo{
        let object = NSEntityDescription.insertNewObject(forEntityName: "CoreChapterListInfo",
                                                         into: context) as! CoreChapterListInfo
        //对象赋值
        object.link = linkType.link
        object.title = linkType.title
        //保存
        //contextSave(info:object.description)
        //
        return object
    }
    
    static  func addChapterInfo(content:String?) -> CoreChapterInfo{
        let object = NSEntityDescription.insertNewObject(forEntityName: "CoreChapterInfo",
                                                         into: context) as! CoreChapterInfo
        //对象赋值
        object.content = content
        //保存
        //contextSave(info:object.description)
        //
        return object
    }
    
    static func updateBookSourceInfo(sourceId:String,links:[LinkType],content:[String?]) -> Void {
        
        //创建User对象
        let temp = getBookSourceInfos(sourceId: sourceId)
        if temp.count != 1 {
            fatalError("update failed")
        }
        let object = temp[0]
        //对象赋值
        var chapterListArray:[CoreChapterListInfo] = object.chapterList?.array as! [CoreChapterListInfo]
        for i in links[chapterListArray.count..<links.count] {
            chapterListArray.append(addChapterListInfo(linkType: i))
        }
//        for i in links.enumerated() {
//            chapterListArray[i.offset].link = i.element.link
//            chapterListArray[i.offset].title = i.element.title
//        }
        object.chapterList = NSOrderedSet.init(array: chapterListArray)
        var chapterArray:[CoreChapterInfo] = object.chapters?.array as! [CoreChapterInfo]
        for k in content[..<chapterArray.count].enumerated(){
            chapterArray[k.offset].content = k.element
        }
        for j in content[chapterArray.count..<content.count] {
            chapterArray.append(addChapterInfo(content: j))
        }
        object.chapters = NSOrderedSet.init(array: chapterArray)
        //保存
        contextSave(info:"更新书源\(object.id!)")
    }
    static func saveChapter(sourceId:String,offset:Int,content:String){
        //创建User对象
        let temp = getBookSourceInfos(sourceId: sourceId)
        if temp.count != 1 {
            fatalError("save chapter failed")
        }
        let object = temp[0]
        //对象赋值
        var chapterArray:[CoreChapterInfo] = object.chapters?.array as! [CoreChapterInfo]
        chapterArray[offset].content = content
        object.chapters = NSOrderedSet.init(array: chapterArray)
        //保存
        contextSave(info:"更新书源\(object.id!)的第\(offset+1)章")
    }
    static func deleteObject(obj:NSManagedObject){
        context.delete(obj)
        contextSave(info: "删除后")
    }
    
    
}
