//
//  ChapterListItemAtoc.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/30.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
struct ChapterListItemAtoc:Codable {
    let _id:String
    let book:String
    let chapters:[LinkType]
    let updated:String
}
