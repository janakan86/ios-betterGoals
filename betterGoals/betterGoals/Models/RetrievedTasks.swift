//
//  RetrievedTasks.swift
//  betterGoals
//
//  Created by K Janakan on 17/11/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation
import CoreData


/*
   This class is used to store the goals as observable
 */
final class retrievedTasks: ObservableObject {
    @Published var tasks:[Task] = []
    
    var sharedManagedContext : NSManagedObjectContext;
    
    init(goalID:String, sharedManagedContext : NSManagedObjectContext){
        self.sharedManagedContext = sharedManagedContext
        self.tasks = DataService.sharedDataService.getTasks(byGoalID: goalID, inContext : self.sharedManagedContext)
        
    }
    
    func refresh(goalID:String, sharedManagedContext : NSManagedObjectContext){
        self.tasks = DataService.sharedDataService.getTasks(byGoalID: goalID, inContext : sharedManagedContext)
    }
    
    
    func toggleIsFavorite(index:Int){
        tasks[index].isFavorite.toggle()
        objectWillChange.send()
        
    }
    

    
    func deleteTask(atIndex index:Int){
    
        //remove from array used to display
        let removedTask = tasks.remove(at: index)
        
        DataService.sharedDataService.deleteTask(task: removedTask, inContext: self.sharedManagedContext)
        
        objectWillChange.send()
    }
    
    
    
    func deleteTasks(atOffsets offsets: IndexSet){
        
        for index in offsets {
            //remove from array
            let removedTask = tasks.remove(at: index)
            
            //remove from persistence
            DataService.sharedDataService.deleteTask(task: removedTask, inContext: self.sharedManagedContext)
        }
        objectWillChange.send()
    }
}
