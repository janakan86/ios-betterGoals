//
//  betterGoalsTests.swift
//  betterGoalsTests
//
//  Created by K Janakan on 1/5/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//
import CoreData

import XCTest
@testable import betterGoals

class testGoals: XCTestCase {
    
    
    var container: NSPersistentContainer?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        DataService.sharedDataService.clearGoalsSampleData(inContext: PersistenceManager.shared.context)
        print("hello setUpWithError")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DataService.sharedDataService.clearGoalsSampleData(inContext: PersistenceManager.shared.context)
        print("hello tearDownWithError")

    }

    func testSimpleGoalInsert() throws {
        let newGoal = NewGoal()
        newGoal.itemID = "Test"
        newGoal.itemUIType = 1
        newGoal.itemDescription = "Desciption"
        
        
        DataService.sharedDataService.insertGoal(withData: newGoal,
                                                 inContext: PersistenceManager.shared.context)
        
    }
    
    func testGoalsRead() throws {
        let goals = DataService.sharedDataService.getGoals(inContext: PersistenceManager.shared.context)
        
        for goal in goals{
            XCTAssertEqual(goal.itemID, "Test")
        }
        
        
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
