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
