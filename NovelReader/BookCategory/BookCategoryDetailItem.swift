//
//  BookCategoryDetailItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/19.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
struct BookCategoryDetailBookItem : Codable {
    let _id:String
    let title:String
    let author:String
    let shortIntro:String
    let cover:String
    let majorCate:String
    let minorCate:String
    let latelyFollower:Int
    let retentionRatio:Double
    let lastChapter:String
}

struct BookCategoryDetailBooksItem : Codable{
    let total:Int
    let books:[BookCategoryDetailBooksItem]
}
