//
//  AppDelegate.swift
//  betterGoals
//
//  Created by K Janakan on 1/5/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /* dangerous territory. Removed whole store */
        // PersistenceManager.shared.deleteStore()
        /* */

        
        //load sample data
        //DataService.sharedDataService.clearGoalsSampleData(inContext:PersistenceManager.shared.context)
       // DataService.sharedDataService.storeGoalsSampleData(inContext:PersistenceManager.shared.context)
        
        
        //DataService.sharedDataService.clearScheduledItemsSampleData(inContext:PersistenceManager.shared.context)
        //DataService.sharedDataService.loadSampleScheduledItems(inContext:PersistenceManager.shared.context)
        
        
        DataService.sharedDataService.clearTasks(inContext:PersistenceManager.shared.context)
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    


}

