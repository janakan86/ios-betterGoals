//
//  Item.swift
//  betterGoals
//
//  Created by K Janakan on 10/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation

protocol Item {
    
    var itemID:Int32 { get set }
    var itemDescription:String { get set }
    var itemUIType:String { get set } //what type of UI to display this ( e.g color and icon )
    
}


class Goal: Item , Codable {
    
    init(startDate: Date? = nil, endDate: Date? = nil, itemID: Int32, itemDescription: String, itemUIType: String) {
        self.startDate = startDate
        self.endDate = endDate
        self.itemID = itemID
        self.itemDescription = itemDescription
        self.itemUIType = itemUIType
    }
    
     
    var startDate:Date?
    var endDate:Date?
    
    //following properties are from Item Protocol
    var itemID: Int32
    var itemDescription: String
    var itemUIType: String
    
    
}



