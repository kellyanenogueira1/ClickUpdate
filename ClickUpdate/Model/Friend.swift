//
//  Friend+CoreDataClass.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 06/02/21.
//
//

import Foundation
import CoreData

@objc(Friend)
public class Friend: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var phoneNumber: String?
    @NSManaged public var user: User?
}

extension Friend : Identifiable {

}
