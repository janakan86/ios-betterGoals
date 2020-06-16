//
//  constants.swift
//  betterGoals
//
//  Created by K Janakan on 7/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation
import SwiftUI


struct ItemTypesUIDefaults {
    
    static let uiDefaults = [
        "sports": ItemUIValues(name:"sports",color:Color("greyishBlue"),defaultIcon:"shoe"),
        "financial": ItemUIValues(name:"financial",color:Color (.white),defaultIcon:"piggybank")
    ]
    
    static func getItemUIDefault(usingUIName:String) -> ItemUIValues {
        return uiDefaults[usingUIName]!
    }

}

struct ItemUIValues {
    
    var name:String
    var color:Color
    var defaultIcon:String
    
}
