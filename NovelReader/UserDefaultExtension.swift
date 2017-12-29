//
//  UserDefaultExtension.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/28.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults{
    func getUserDefaults(key:String) -> Any? {
        let t = self.object(forKey: key)
        if t == nil {
            switch key {
            case ReaderInfo.fontSize:
                self.set(22, forKey: key)
                return 22
            case ReaderInfo.backgroundColor:
                self.set(UIColor.white.hexString(false), forKey: key)
                return UIColor.white.hexString(false)
            case ReaderInfo.isNight:
                self.set(false, forKey: key)
                return false
            case ReaderInfo.lineSpacing:
                self.set(3, forKey: key)
                return 3
            default:
                print("没有这个key！！")
            }
        }
        return t
    }
}
