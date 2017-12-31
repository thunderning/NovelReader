//
//  CoreBookInfo+CoreDataProperties.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/29.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//
//

import Foundation
import CoreData


extension CoreBookInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreBookInfo> {
        return NSFetchRequest<CoreBookInfo>(entityName: "CoreBookInfo")
    }

    @NSManaged public var currentChapter: Int32
    @NSManaged public var id: String?
    @NSManaged public var latestTitle: String?
    @NSManaged public var name: String?
    @NSManaged public var sourceId: String?
    @NSManaged public var image: String?
}
