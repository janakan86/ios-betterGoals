//
//  Goal+CoreDataProperties.swift
//  betterGoals
//
//  Created by K Janakan on 9/9/20.
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
    @NSManaged public var tasks: NSSet?

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
    @NSManaged public func removeFromTasks(_ values: NSSet)

}


/*
     class used to temporarily store the new Goal details before it is persisted
     The object will be passed around the goal creation screens.
     This helps in solving the complexity involved passing around a NSManagedObject Goal,
     which may or may not get saved.
 */
final class NewGoal : ObservableObject{
    @Published var startDate:Date = Date()
    @Published var endDate:Date = Date()
    
    //following properties are from Item Protocol
    @Published var goalID: String = ""
    @Published var goalDescription: String = ""
    @Published var itemUIType: Int16 = 0
}
