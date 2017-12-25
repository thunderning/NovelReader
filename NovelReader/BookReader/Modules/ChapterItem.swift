//
//  ChapterItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/24.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
struct ChapterItem : Codable {
    let ok:Bool
    struct Chapter:Codable {
        let title:String
        let body:String
    }
    let chapter:Chapter
}
