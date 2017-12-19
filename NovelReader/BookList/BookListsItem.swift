//
//  BookListsItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/10.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
struct BookListsItem : Codable {
    let total:Int
    let bookLists:[BookListItem]
}

struct BookListItem : Codable {
    let _id:String
    let title:String
    let author:String
    let desc:String        //描述
    let cover:String       //图片地址
    let collectorCount:Int //收藏人数
    let bookCount:Int      //书数
}
