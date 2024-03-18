//
//  Listofdata+CoreDataProperties.swift
//  project1.1
//
//  Created by Md Akash on 18/3/24.
//
//

import Foundation
import CoreData


extension Listofdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Listofdata> {
        return NSFetchRequest<Listofdata>(entityName: "Listofdata")
    }

    @NSManaged public var name: String?

}

extension Listofdata : Identifiable {

}
