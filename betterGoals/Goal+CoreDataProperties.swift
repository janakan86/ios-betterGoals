//
//  Goal+CoreDataProperties.swift
//  betterGoals
//
//  Created by K Janakan on 11/12/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goals")
    }

    @NSManaged public var endDate: Date?
    @NSManaged public var goalDescription: String
    @NSManaged public var goalID: String
    @NSManaged public var itemUIType: Int16
    @NSManaged public var startDate: Date?
    @NSManaged public var tasks: Set<Task>?
    @NSManaged public var scheduledGoals: NSSet?

}

// MARK: Generated accessors for tasks
extension Goal {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: Set<Task>)


}

// MARK: Generated accessors for scheduledGoals
extension Goal {

    @objc(addScheduledGoalsObject:)
    @NSManaged public func addToScheduledGoals(_ value: ScheduledItems)

    @objc(removeScheduledGoalsObject:)
    @NSManaged public func removeFromScheduledGoals(_ value: ScheduledItems)

    @objc(addScheduledGoals:)
    @NSManaged public func addToScheduledGoals(_ values: NSSet)

    @objc(removeScheduledGoals:)
    @NSManaged public func removeFromScheduledGoals(_ values: NSSet)

}

extension Goal : Identifiable {

}
