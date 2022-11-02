//
//  Meter+CoreDataProperties.swift
//  SomeCoreData
//
//  Created by Evgen on 01/11/2022.
//  Copyright © 2022 Evgen. All rights reserved.
//
//

import Foundation
import CoreData


extension Meter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meter> {
        return NSFetchRequest<Meter>(entityName: "Meter")
    }

    @NSManaged public var name: String?
    @NSManaged public var value: NSDecimalNumber?
    @NSManaged public var type: Int16

}
