//
//  StaticLets.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/28.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
import UIKit

let API_URL:String = "http://api.zhuishushenqi.com/"
let CHAPTER_URL:String = "http://chapterup.zhuishushenqi.com/chapter/"
let STATICS_URL:String = "http://statics.zhuishushenqi.com/"
let connectService = ConnectService()
let device = UIDevice.current
let defaultStandard = UserDefaults.standard


struct ReaderInfo {
    static let fontSize = "fontSize"
    static let lineSpacing = "lineSpacing"
    static let backgroundColor = "backgroundColor"
    static let isNight = "isNight"
}

