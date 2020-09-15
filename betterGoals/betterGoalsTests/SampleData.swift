//
//  SampleData.swift
//  betterGoalsTests
//
//  Created by K Janakan on 9/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation
import betterGoals
import CoreData

class SampleData{
    
    static func storeSampleGoal(withGoalID goalID:String, inContext managedContext: NSManagedObjectContext){
              let goal = Goal(context:managedContext)
              
              goal.goalID = goalID
              goal.itemUIType = 1
              goal.startDate = Date()
              goal.endDate = Date()
              goal.goalDescription = "Sample goal"
              
              do {
                  try managedContext.save()
                  
              } catch{
                  managedContext.rollback()
              }
              
        
       // for goal in goalsSampleData {
            
            managedContext.insert(goal)
            do {
                try managedContext.save()
                
            } catch{
                managedContext.rollback()
            }
      //  }
    }
    
    static func clearGoalsSampleData(inContext managedContext: NSManagedObjectContext){
      
        
        let storedGoalsFetchRequest = NSFetchRequest<Goal>(entityName: "Goals")
        
        do {
            //we can loop and delete since it is sample data
            let goals = try managedContext.fetch(storedGoalsFetchRequest)
            
            for goal in goals {
                managedContext.delete(goal)
            }
            try managedContext.save()
            
        } catch{
            managedContext.rollback()
        }
    }
    
    
    static func loadSampleScheduledItems(inContext managedContext: NSManagedObjectContext){
        
        let si = ScheduledItems(context: managedContext)
        
        si.scheduledItemId = 1
        si.taskID = 1
        si.date = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        
        
        
        
        let si2 = ScheduledItems(context: managedContext)
        si2.date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        si2.scheduledItemId = 2
        si2.taskID = 2
        
        
        let si3 = ScheduledItems(context: managedContext)
        si3.date = Calendar.current.date(byAdding: .day, value: 2, to: Date())!
        si3.scheduledItemId = 3
        si3.taskID = 3
        
        do {
            try managedContext.save()
            
        } catch{
            managedContext.rollback()
        }
        
    }
    
    
    static func clearScheduledItemsSampleData(inContext managedContext: NSManagedObjectContext){
        
        let storedScheduledItems = NSFetchRequest<ScheduledItems>(entityName: "ScheduledItems")
        
        do {
            //we can loop and delete since it is sample data
            let ScheduledItems = try managedContext.fetch(storedScheduledItems)
            
            for si in ScheduledItems {
                managedContext.delete(si)
            }
            try managedContext.save()
            
        } catch{
            managedContext.rollback()
        }
    }
    
    
    static func clearTasks(inContext managedContext: NSManagedObjectContext){
        let storedTasks = NSFetchRequest<Task>(entityName: "Tasks")
               
               do {
                   //we can loop and delete since it is sample data
                   let tasks = try managedContext.fetch(storedTasks)
                   
                   for si in tasks {
                       managedContext.delete(si)
                   }
                   try managedContext.save()
                   
               } catch{
                   managedContext.rollback()
               }
    }
}
