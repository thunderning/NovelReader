//
//  BookItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/10.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
struct BookDetailItem : Codable {
    let _id:String
    let title:String
    let author:String
    let longIntro:String
    let cover:String       //图片地址
    let majorCate:String   //主分类
    let minorCate:String   //分类
    struct Rate : Codable{
        let count:Int      //评分总数
        let score:Double   //分数10分制
        let isEffect:Bool
    }
    let rating:Rate
    let latelyFollower:Int  //追书人气
    let wordCount:Int       //字数
    let serializeWordCount:Int //日更字数
    let retentionRatio:String  //留存率
    let updated:String      //最后更新
    let isSerial:Bool       //是否连载
    let chaptersCount:Int   //总章节数
    let lastChapter:String  //最新章节
    let tags:[String]       //标签
}
