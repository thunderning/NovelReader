//
//  ChapterListItem.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/25.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
struct ChapterListItem:Codable {
    struct MT : Codable{
        let _id:String
        let book:String
        let chaptersCount1:Int
        let chaptersUpdated:String
        
        struct Chapter : Codable {
            let title:String
            let link:String
            let unreadble:Bool
        }
        
        let chapters:[Chapter]
        let updated:String
    }
    let mixToc:MT
    let ok:Bool
}
