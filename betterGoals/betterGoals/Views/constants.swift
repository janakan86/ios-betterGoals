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
        1: ItemUI(id:1, name:"sports",color:Color("greyishBlue"),defaultIcon:"shoe"),
        2: ItemUI(id:2,name:"financial",color:Color (.black),defaultIcon:"piggybank")
    ]
    
    static func getItemUIDefault(usingID:Int) -> ItemUI {
        return uiDefaults[usingID]!
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
