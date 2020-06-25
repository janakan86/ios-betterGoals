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

class coreDataTests: XCTestCase {
    
    
    var container: NSPersistentContainer?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        DataService.sharedDataService.clearGoalsSampleData()
        print("hello setUpWithError")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("hello tearDownWithError")

    }

    func testSimpleGoalInsert() throws {
        
    }
    
    func testGoalsRead() throws {
        DataService.sharedDataService.storeGoalsSampleData()
        let goals = DataService.sharedDataService.getGoals()
        
        XCTAssertTrue(goals.count > 0, "goals couldn't be read")
    
        
    }
    
    func testGoalsInsertWithSubGoal() throws {
          // This is an example of a functional test case.
          // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
