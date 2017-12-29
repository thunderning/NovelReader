//
//  CoreBookSourceInfo+CoreDataProperties.swift
//  NovelReader
//
//  Created by 吴佳玮 on 2017/12/29.
//  Copyright © 2017年 吴佳玮. All rights reserved.
//
//

import Foundation
import CoreData


extension CoreBookSourceInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreBookSourceInfo> {
        return NSFetchRequest<CoreBookSourceInfo>(entityName: "CoreBookSourceInfo")
    }

    @NSManaged public var id: String?
    @NSManaged public var chapterList: NSOrderedSet?
    @NSManaged public var chapters: NSOrderedSet?

}

// MARK: Generated accessors for chapterList
extension CoreBookSourceInfo {

    @objc(insertObject:inChapterListAtIndex:)
    @NSManaged public func insertIntoChapterList(_ value: CoreChapterListInfo, at idx: Int)

    @objc(removeObjectFromChapterListAtIndex:)
    @NSManaged public func removeFromChapterList(at idx: Int)

    @objc(insertChapterList:atIndexes:)
    @NSManaged public func insertIntoChapterList(_ values: [CoreChapterListInfo], at indexes: NSIndexSet)

    @objc(removeChapterListAtIndexes:)
    @NSManaged public func removeFromChapterList(at indexes: NSIndexSet)

    @objc(replaceObjectInChapterListAtIndex:withObject:)
    @NSManaged public func replaceChapterList(at idx: Int, with value: CoreChapterListInfo)

    @objc(replaceChapterListAtIndexes:withChapterList:)
    @NSManaged public func replaceChapterList(at indexes: NSIndexSet, with values: [CoreChapterListInfo])

    @objc(addChapterListObject:)
    @NSManaged public func addToChapterList(_ value: CoreChapterListInfo)

    @objc(removeChapterListObject:)
    @NSManaged public func removeFromChapterList(_ value: CoreChapterListInfo)

    @objc(addChapterList:)
    @NSManaged public func addToChapterList(_ values: NSOrderedSet)

    @objc(removeChapterList:)
    @NSManaged public func removeFromChapterList(_ values: NSOrderedSet)

}

// MARK: Generated accessors for chapters
extension CoreBookSourceInfo {

    @objc(insertObject:inChaptersAtIndex:)
    @NSManaged public func insertIntoChapters(_ value: CoreChapterInfo, at idx: Int)

    @objc(removeObjectFromChaptersAtIndex:)
    @NSManaged public func removeFromChapters(at idx: Int)

    @objc(insertChapters:atIndexes:)
    @NSManaged public func insertIntoChapters(_ values: [CoreChapterInfo], at indexes: NSIndexSet)

    @objc(removeChaptersAtIndexes:)
    @NSManaged public func removeFromChapters(at indexes: NSIndexSet)

    @objc(replaceObjectInChaptersAtIndex:withObject:)
    @NSManaged public func replaceChapters(at idx: Int, with value: CoreChapterInfo)

    @objc(replaceChaptersAtIndexes:withChapters:)
    @NSManaged public func replaceChapters(at indexes: NSIndexSet, with values: [CoreChapterInfo])

    @objc(addChaptersObject:)
    @NSManaged public func addToChapters(_ value: CoreChapterInfo)

    @objc(removeChaptersObject:)
    @NSManaged public func removeFromChapters(_ value: CoreChapterInfo)

    @objc(addChapters:)
    @NSManaged public func addToChapters(_ values: NSOrderedSet)

    @objc(removeChapters:)
    @NSManaged public func removeFromChapters(_ values: NSOrderedSet)

}
