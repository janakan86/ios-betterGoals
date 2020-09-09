//
//  Task+CoreDataProperties.swift
//  betterGoals
//
//  Created by K Janakan on 9/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Tasks")
    }

    @NSManaged public var taskID: String?
    @NSManaged public var parentGoal: Goal?

}
