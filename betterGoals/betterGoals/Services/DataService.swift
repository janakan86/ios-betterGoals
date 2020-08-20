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
    
    
    
    
    
    
    
   /* This function accetps a newGoal, uses the stored data and creates NSManagedObject Goal*/
    func insertGoal(withData newGoal:NewGoal,inContext managedContext: NSManagedObjectContext){
        
        let goal = Goal(context:managedContext)
        
        goal.itemID = newGoal.itemID
        goal.itemUIType = newGoal.itemUIType
        goal.startDate = newGoal.startDate
        goal.endDate = newGoal.endDate
        goal.itemDescription = newGoal.itemDescription
        
        do {
            try managedContext.save()
            
        } catch{
            managedContext.rollback()
        }
        
    }

    func getScheduledItems(between fromDate:Date, and toDate:Date,inContext managedContext: NSManagedObjectContext)->[ScheduledItems]{
        
        let fromPredicate = NSPredicate(format: "%@ >= %@", Date() as NSDate, fromDate as NSDate)
        let toPredicate = NSPredicate(format: "%@ < %@", Date() as NSDate, toDate as NSDate)
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
    
    
    func storeGoalsSampleData(inContext managedContext: NSManagedObjectContext){
        let goalsSampleData: [Goal] = self.load("sampleGoals.json")
        
        for goal in goalsSampleData {
            
            managedContext.insert(goal)
            do {
                try managedContext.save()
                
            } catch{
                managedContext.rollback()
            }
        }
    }
    
    
    func clearGoalsSampleData(inContext managedContext: NSManagedObjectContext){
      
        
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
    
    
    func loadSampleScheduledItems(inContext managedContext: NSManagedObjectContext){
        
        let si = ScheduledItems(context: managedContext)
        
        si.scheduledItemId = 1
        si.taskID = 1
        si.date = DateDisplayCalculations.getFollowingDay(withOffset: 0, forDate: Date())
        
        
        
        let si2 = ScheduledItems(context: managedContext)
        si2.date = DateDisplayCalculations.getFollowingDay(withOffset: 1, forDate: Date())
        si2.scheduledItemId = 2
        si2.taskID = 2
        
        
        let si3 = ScheduledItems(context: managedContext)
        si3.date = DateDisplayCalculations.getFollowingDay(withOffset: 14, forDate: Date())
        si3.scheduledItemId = 3
        si3.taskID = 3
        
        do {
            try managedContext.save()
            
        } catch{
            managedContext.rollback()
        }
        
    }
    
    
    func clearScheduledItemsSampleData(inContext managedContext: NSManagedObjectContext){
        
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

}

