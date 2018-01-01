//
//  BookRankItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/11.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
struct BookRankItem : Codable {
    let _id:String
    let title:String
    let cover:String       //图片地址
    let shortTitle:String
}


struct BookRankItems : Codable {
    let female:[BookRankItem]
    let male:[BookRankItem]
}
