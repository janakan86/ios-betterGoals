//
//  PersistentManager.swift
//  betterGoals
//
//  Created by K Janakan on 24/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation
import CoreData


class PersistenceManager{
    
    private init(){}
    static var shared = PersistenceManager()
    
    lazy var context =  persistenceContainer.viewContext
    
    lazy var persistenceContainer: NSPersistentContainer =  {

        let container =  NSPersistentContainer(name:"coreDataModel")

        // The following snippet of code is not mandatory. SQLite store will be used by default
        // - start snippet - defining store type - //
        let description = NSPersistentStoreDescription()
        description.type = NSSQLiteStoreType //other probable values NSInMemoryStoreType ,NSBinaryStoreType
        
        if description.type == NSSQLiteStoreType || description.type == NSBinaryStoreType {
            // for persistence on local storage we need to set url
            description.url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                .first?.appendingPathComponent("betterGoals")
        }

        container.persistentStoreDescriptions = [description]
        // - end snippet - //
        

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
            
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        return container

    }()




    func saveCoreDataContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    
    }
}
