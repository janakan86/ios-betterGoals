//
//  DataService.swift
//  betterGoals
//
//  Created by K Janakan on 10/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation
import CoreData

class DataService{
    
    private init(){}
    static let sharedDataService = DataService()
    
    
    func getGoals(inContext managedContext: NSManagedObjectContext)-> [Goal]{
        
        var storedGoals:[Goal] = []
        
        
        let goalsFetchRequest = NSFetchRequest<Goal>(entityName: "Goals")
        
        do{
            storedGoals = try managedContext.fetch(goalsFetchRequest)
            
        }
        catch{
            print("\(error)")
        }
        
        return storedGoals
    }
    
    
    
    func getGoals(byGoalID goalID:String ,inContext managedContext: NSManagedObjectContext) -> [Goal] {
        var retrievedGoal:[Goal] = []
        
        let fetchByIDPredicate = NSPredicate(format: "goalID == %@", goalID)
        let goalsFetchRequest = NSFetchRequest<Goal>(entityName: "Goals")

        
        goalsFetchRequest.predicate = fetchByIDPredicate
        
        do{
            retrievedGoal = try managedContext.fetch(goalsFetchRequest)
            
        }
        catch{
            print("\(error)")
        }
        
        return retrievedGoal
    }
    
    
    
    func deleteGoal(byGoalID goalID:String ,inContext managedContext: NSManagedObjectContext) {
        let retrievedGoals:[Goal] = getGoals(byGoalID: goalID, inContext: managedContext)
        
        do{
            for goal in retrievedGoals{
                managedContext.delete(goal)
            }
            try managedContext.save()
        }
        catch{
            print("\(error)")
        }
        
    }

    
   /* This function accetps a newGoal, uses the stored data and creates NSManagedObject Goal*/
    func insertGoal(withData newGoal:NewGoal,inContext managedContext: NSManagedObjectContext)-> Goal?{
        
        let goal = Goal(context:managedContext)
        
        goal.goalID = newGoal.goalID
        goal.itemUIType = newGoal.itemUIType
        goal.startDate = newGoal.startDate
        goal.endDate = newGoal.endDate
        goal.goalDescription = newGoal.goalDescription
        
        do {
            try managedContext.save()
            return goal
            
        } catch{
            managedContext.rollback()
        }
        
        return nil
        
    }
   
    
    func insertTask(taskID:String,goalID:String,inContext managedContext: NSManagedObjectContext){
        
        let task = Task(context:managedContext)
        task.taskID = taskID
        
        let goals = getGoals(byGoalID: goalID, inContext: managedContext)
        
        //TODO validate to see whether only one goal exists.
        
        //add as an entity relationship
        goals[0].addToTasks(task)
        
        do {
            try managedContext.save()
            
        } catch{
            managedContext.rollback()
        }
    }
    

    func getScheduledItems(between fromDate:Date, and toDate:Date,inContext managedContext: NSManagedObjectContext)->[ScheduledItems]{
        
        let fromPredicate = NSPredicate(format: "date >= %@", fromDate as NSDate)
        let toPredicate = NSPredicate(format: "date < %@", toDate as NSDate)
        let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
        
        let scheduledItemFetchRequest = NSFetchRequest<ScheduledItems>(entityName: "ScheduledItems")
        
        var fetchedResults:[ScheduledItems] = []
        
        scheduledItemFetchRequest.predicate = datePredicate
        do {
            fetchedResults = try managedContext.fetch(scheduledItemFetchRequest)
            
        }
        catch {
            print ("fetch task failed", error)
        }
        
        return fetchedResults
        
    }
    
    
    func getScheduledItems(forMonthProperties monthProperties:MonthProperties,inContext managedContext: NSManagedObjectContext)->[ScheduledItems]{
           
        return self.getScheduledItems(between: monthProperties.firstDayOfMonth, and: monthProperties.lastDayOfMonth, inContext: managedContext)
           
       }
    
    
    //json loader code taken from SWIFT UI official tutorial
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename)")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename)")
        }
        
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    

    
    
    

}

