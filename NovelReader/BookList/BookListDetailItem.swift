//
//  BookListDetailItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/10.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
struct BookListDetailbookItem : Codable {
    let _id:String
    let title:String
    let author:String
    let longIntro:String
    let cover:String       //图片地址
    let majorCate:String   //主分类
    let minorCate:String   //分类
    let latelyFollower:Int  //追书人气
    let wordCount:Int       //字数
    let retentionRatio:String  //留存率
}

struct BookListDetailbooksItem : Codable{
    let book:BookListDetailbookItem
    let comment:String
}

struct BookListDetailItem : Codable{
    let _id:String
    let title:String
    struct Author : Codable {
        let nickname:String
    }
    let author:Author
    let decs:String
    let gender:String
    let collectorCount:Int
    let total:Int
    let books:[BookListDetailbooksItem]
}
