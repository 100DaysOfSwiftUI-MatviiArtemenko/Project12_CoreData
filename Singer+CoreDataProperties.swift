//
//  Singer+CoreDataProperties.swift
//  Project12_CoreData
//
//  Created by admin on 25.08.2022.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    
    public var wrapperdFirstName: String {
        firstName ?? "Unknown"
    }
    public var wrapperdLastName: String {
        lastName ?? "Unknown"
    }

}

extension Singer : Identifiable {

}
