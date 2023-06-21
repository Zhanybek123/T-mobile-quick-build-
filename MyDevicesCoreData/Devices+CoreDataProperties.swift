//
//  Devices+CoreDataProperties.swift
//  MyDevicesCoreData
//
//  Created by zhanybek salgarin on 4/26/23.
//
//

import Foundation
import CoreData


extension Devices {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Devices> {
        return NSFetchRequest<Devices>(entityName: "Devices")
    }

    @NSManaged public var name: String?
    @NSManaged public var deviceType: String?

}

extension Devices : Identifiable {

}
