//
//  Report+CoreDataProperties.swift
//  SomeCoreData
//
//  Created by Evgen on 01/11/2022.
//  Copyright © 2022 Evgen. All rights reserved.
//
//

import Foundation
import CoreData


extension Report {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Report> {
        return NSFetchRequest<Report>(entityName: "Report")
    }

    @NSManaged public var date: Date?
    @NSManaged public var relationship: NSSet?

}

// MARK: Generated accessors for relationship
extension Report {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: Meter)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: Meter)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}
