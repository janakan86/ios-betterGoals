//
//  RetrievedEntityObjects.swift
//  betterGoals
//
//  Created by K Janakan on 15/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation
import CoreData


/*
   This class is used to store the goals as observable
 */
final class Goals: ObservableObject {
    @Published var goals:[Goal] = []
    
    init(sharedManagedContext : NSManagedObjectContext){
        self.goals = DataService.sharedDataService.getGoals(inContext : sharedManagedContext)
    }
    
    func refresh(sharedManagedContext : NSManagedObjectContext){
        self.goals = DataService.sharedDataService.getGoals(inContext : sharedManagedContext)
    }
}



final class RetrievedScheduledItems: ObservableObject {
    
    @Published var scheduledItems:[ScheduledItems] = []
    
    init(scheduledItems:[ScheduledItems]){
        self.scheduledItems = scheduledItems
    }
    
    // Need to look for a more efficient way to do this. This is used by the weekly view
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
    
    
    //return the day component of the scheduledItems only. This is used by the monthly view
    func getScheduledItemDaysOnly() -> [Bool]{
        
        var dayValue: [Bool] = [Bool](repeating: false, count: 32)
        
        for item in scheduledItems{
            
            guard let itemDate = item.date else {
                return dayValue
            }
            
            dayValue[Calendar.current.component(.day, from: itemDate)] = true
        }
        
        return dayValue
    }
    
}
