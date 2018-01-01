//
//  BookRankDetailItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2018/1/1.
//  Copyright © 2018年 吴佳玮. All rights reserved.
//

import Foundation

struct BookRankDetailItem : Codable {
    let _id:String
    let title:String
    let author:String
    let shortIntro:String
    let cover:String       //图片地址
    let majorCate:String   //主分类
    let minorCate:String   //分类
    let latelyFollower:Int  //追书人气
    let retentionRatio:String  //留存率
}

struct BookRankDetailItems : Codable {
    struct Ranking : Codable {
        let _id:String
        let title:String
        let books:[BookRankDetailItem]
    }
    let ranking:Ranking
}
