//
//  Task+CoreDataClass.swift
//  betterGoals
//
//  Created by K Janakan on 7/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//
//

import Foundation
import CoreData


public class Task: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
           return NSFetchRequest<Task>(entityName: "Tasks")
       }

       @NSManaged public var goalID: String?
       @NSManaged public var habitsID: String?
       @NSManaged public var taskID: String?

}
