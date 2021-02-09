//
//  User+CoreDataClass.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 06/02/21.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var callEmergency: NSSet?
    
}
