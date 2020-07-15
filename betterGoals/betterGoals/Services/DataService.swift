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
    
    
    
    func storeGoalsSampleData(inContext managedContext: NSManagedObjectContext){
        let goalsSampleData: [Goal] = self.load("sampleGoals.json")
        
        for goal in goalsSampleData {
            insertGoal(goal: goal,inContext: managedContext)
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
    
    
    func createGoal(inContext context: NSManagedObjectContext) -> Goal {
        return Goal(context:context)
    }
    
    
    func insertGoal(goal:Goal,inContext managedContext: NSManagedObjectContext){
        
        managedContext.insert(goal)
        
        do {
            try managedContext.save()
            
        } catch{
            managedContext.rollback()
        }
        
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

