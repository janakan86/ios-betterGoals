//
//  TaskTests.swift
//  betterGoalsTests
//
//  Created by K Janakan on 10/9/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import CoreData

import XCTest
@testable import betterGoals

class testTask: XCTestCase {
    
    
    var container: NSPersistentContainer?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //SampleData.clearGoalsSampleData(inContext: PersistenceManager.shared.context)
        SampleData.storeSampleGoal(withGoalID: "jana", inContext: PersistenceManager.shared.context)
        SampleData.storeSampleGoal(withGoalID: "jana2",inContext: PersistenceManager.shared.context)
        print("hello setUpWithError")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DataService.sharedDataService.deleteGoal(byGoalID: "jana",inContext: PersistenceManager.shared.context)
        DataService.sharedDataService.deleteGoal(byGoalID: "jana2",inContext: PersistenceManager.shared.context)
        DataService.sharedDataService.deleteTasks(forGoalWithID: "jana2", inContext: PersistenceManager.shared.context)
        print("hello tearDownWithError")

    }
    
    func testGoalsRead() throws {
        let goals = DataService.sharedDataService.getGoals(byGoalID:"jana",inContext: PersistenceManager.shared.context)
        
        for goal in goals{
            XCTAssertEqual(goal.goalID, "jana")
        }
    }
    
    func testSimpleTaskInsert() throws {
        DataService.sharedDataService.insertTask(forGoalWithID: "jana", taskID: "taskID", inContext: PersistenceManager.shared.context)
        
        let tasks = DataService.sharedDataService.getTasks(byGoalID: "jana", inContext: PersistenceManager.shared.context)
        
        for task in tasks{
            XCTAssertEqual(task.taskID, "taskID")
        }
        
    }
    
   
    
    func testTaskDelete() throws {
        
        DataService.sharedDataService.insertTask(forGoalWithID: "jana2", taskID: "taskID2", inContext: PersistenceManager.shared.context)
        
        let tasks = DataService.sharedDataService.getTasks(byGoalID: "jana2", inContext: PersistenceManager.shared.context)
        
        for task in tasks{
            XCTAssertEqual(task.taskID, "taskID2")
        }
        
        DataService.sharedDataService.deleteTasks(forGoalWithID: "jana2", inContext: PersistenceManager.shared.context)
        
        
        let tasks2 = DataService.sharedDataService.getTasks(byGoalID: "jana2", inContext: PersistenceManager.shared.context)
        
        XCTAssertTrue(tasks2.count==0)
        
        
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
