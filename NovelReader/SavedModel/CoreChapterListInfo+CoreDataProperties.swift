//
//  CoreChapterListInfo+CoreDataProperties.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/29.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//
//

import Foundation
import CoreData


extension CoreChapterListInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreChapterListInfo> {
        return NSFetchRequest<CoreChapterListInfo>(entityName: "CoreChapterListInfo")
    }

    @NSManaged public var link: String?
    @NSManaged public var title: String?

}
