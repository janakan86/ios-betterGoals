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


final class RetrievedScheduledItems: ObservableObject {
    
    @Published var scheduledItems:[ScheduledItems] = []
    
    init(scheduledItems:[ScheduledItems]){
        self.scheduledItems = scheduledItems
        print(scheduledItems.count)
    }
    
    // Need to look for a more efficient way to do this
    func isScheduledItemExist(forDate date:Date)->Bool{
        for item in scheduledItems{
           
            
            guard let itemDate = item.date else {
                return  false
            }
            
            let order = Calendar.current.compare(date, to: itemDate, toGranularity: .day)
            if(order == .orderedSame){
                return true
            }
        }
        return false
    }
    
}
