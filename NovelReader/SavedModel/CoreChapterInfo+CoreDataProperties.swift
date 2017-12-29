//
//  CoreChapterInfo+CoreDataProperties.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/29.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//
//

import Foundation
import CoreData


extension CoreChapterInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreChapterInfo> {
        return NSFetchRequest<CoreChapterInfo>(entityName: "CoreChapterInfo")
    }

    @NSManaged public var content: String?

}
