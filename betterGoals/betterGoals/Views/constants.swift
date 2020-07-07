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
        "sports": ItemUI(id:1, name:"sports",color:Color("greyishBlue"),defaultIcon:"shoe"),
        "financial": ItemUI(id:2,name:"financial",color:Color (.black),defaultIcon:"piggybank")
    ]
    
    static func getItemUIDefault(usingUIName:String) -> ItemUI {
        return uiDefaults[usingUIName]!
    }
    
    
    static func getAllItemUIValues()-> [ItemUI] {
        var itemUIValues :[ItemUI] = []
        
        for (_ , value) in uiDefaults {
            itemUIValues.append(value)
        }
        
        return itemUIValues
    }
    
}

struct ItemUI:Identifiable {
    
    var id: Int // to confirm with Identifiable protocol

    var name:String
    var color:Color
    var defaultIcon:String
    
}
