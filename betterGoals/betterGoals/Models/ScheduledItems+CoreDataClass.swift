//
//  ScheduledItems+CoreDataClass.swift
//  betterGoals
//
//  Created by K Janakan on 17/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//
//

import Foundation
import CoreData


public class ScheduledItems: NSManagedObject {

    @NSManaged public var scheduledItemId: Int64
    @NSManaged public var taskID: Int64
    @NSManaged public var date: Date?
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduledItems> {
        return NSFetchRequest<ScheduledItems>(entityName: "ScheduledItems")
    }
    

}
