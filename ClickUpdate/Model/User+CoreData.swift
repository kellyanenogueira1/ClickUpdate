//
//  User+CoreDataProperties.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 06/02/21.
//
//

import Foundation
import CoreData


// MARK: Generated accessors for callEmergency
extension User {

    @objc(addCallEmergencyObject:)
    @NSManaged public func addToCallEmergency(_ value: Friend)

    @objc(removeCallEmergencyObject:)
    @NSManaged public func removeFromCallEmergency(_ value: Friend)

    @objc(addCallEmergency:)
    @NSManaged public func addToCallEmergency(_ values: NSSet)

    @objc(removeCallEmergency:)
    @NSManaged public func removeFromCallEmergency(_ values: NSSet)

}

extension User : Identifiable {

}
