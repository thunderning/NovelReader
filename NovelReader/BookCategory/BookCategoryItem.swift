//
//  BookCategoryItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/11.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation

struct BookCategoryItem : Codable {
    let name:String
    let bookCount:String
}

struct BookCategorysItem : Codable {
    let male:[BookCategoryItem]
    let female:[BookCategoryItem]
    let press:[BookCategoryItem]
}
