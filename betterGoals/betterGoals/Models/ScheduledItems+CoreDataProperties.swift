//
//  ScheduledItems+CoreDataProperties.swift
//  betterGoals
//
//  Created by K Janakan on 11/12/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//
//

import Foundation
import CoreData


extension ScheduledItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduledItems> {
        return NSFetchRequest<ScheduledItems>(entityName: "ScheduledItems")
    }

    @NSManaged public var date: Date?
    @NSManaged public var timestart: Int16
    @NSManaged public var timeend: Int16
    @NSManaged public var iswholeday: Bool
    @NSManaged public var note: String?
    @NSManaged public var task: Task?
    @NSManaged public var goal: Goal?

}

extension ScheduledItems : Identifiable {

}
