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
    static let sportsGoalTypeUI = ItemUIValues(name:"sports",color:UIColor.paleBlue,defaultIcon:"shoe")
    static let financialGoalTypeUI = ItemUIValues(name:"financial",color:UIColor.pink,defaultIcon:"piggybank")
}

struct ItemUIValues {
    
    var name:String
    var color:Color
    var defaultIcon:String
    
}


struct UIColor {
    static let paleBlue = Color(red:65/255, green:175/255, blue:195/255, opacity:1 );
    static let pink = Color(red:255/255, green:148/255, blue:154/255, opacity:1 );
}
