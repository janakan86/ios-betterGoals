//
//  NewGoal.swift
//  betterGoals
//
//  Created by K Janakan on 11/12/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

/*
     class used to temporarily store the new Goal details before it is persisted
     The object will be passed around the goal creation screens.
     This helps in solving the complexity involved passing around a NSManagedObject Goal,
     which may or may not get saved.
 */
import Foundation
import CoreData

final class NewGoal : ObservableObject{
    @Published var startDate:Date = Date()
    @Published var endDate:Date = Date()
    
    //following properties are from Item Protocol
    @Published var goalID: String = ""
    @Published var goalDescription: String = ""
    @Published var itemUIType: Int16 = 0
}
