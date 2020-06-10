//
//  constants.swift
//  betterGoals
//
//  Created by K Janakan on 7/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation
import SwiftUI


struct GoalTypesUIDefaults {
    static let sportsGoalTypeUI = ItemUIValues(name:"sports",color:Color("greyishBlue"),defaultIcon:"shoe")
    
    static let financialGoalTypeUI = ItemUIValues(name:"financial",color:Color (.white),defaultIcon:"piggybank")
}

struct ItemUIValues {
    
    var name:String
    var color:Color
    var defaultIcon:String
    
}
