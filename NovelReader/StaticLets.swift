//
//  StaticLets.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/28.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
import SwiftTheme
import Chameleon
import UIKit

let API_URL:String = "http://api.zhuishushenqi.com/"
let CHAPTER_URL:String = "http://chapterup.zhuishushenqi.com/chapter/"
let STATICS_URL:String = "http://statics.zhuishushenqi.com"
let connectService = ConnectService()
let device = UIDevice.current
let defaultStandard = UserDefaults.standard
let themeCellColors:ThemeColorPicker = [UIColor.flatWhite().hexString(false),
                                        UIColor.flatSand().hexString(false)]
let themeBackgroundColors:ThemeColorPicker = [UIColor.flatWhite().darken(byPercentage: 0.05).hexString(false),
                                              UIColor.flatSand().darken(byPercentage: 0.05).hexString(false)]
struct ReaderInfo {
    static let fontSize = "fontSize"
    static let lineSpacing = "lineSpacing"
    static let backgroundColor = "backgroundColor"
    static let isNight = "isNight"
}

