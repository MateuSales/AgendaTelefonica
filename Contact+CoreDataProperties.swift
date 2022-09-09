//
//  Contact+CoreDataProperties.swift
//  AgendaTelefonica
//
//  Created by user on 09/09/22.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String
    @NSManaged public var number: String

}

extension Contact : Identifiable {

}
