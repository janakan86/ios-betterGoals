//
//  Item.swift
//  betterGoals
//
//  Created by K Janakan on 10/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation
import CoreData

protocol Item {
    
    var itemID:Int16 { get set }
    var itemDescription:String { get set }
    var itemUIType:String { get set } //what type of UI to display this ( e.g color and icon )
    
}


final class Goal: NSManagedObject, Codable, Item {
    
    @NSManaged var startDate:Date?
    @NSManaged var endDate:Date?
    
    //following properties are from Item Protocol
    @NSManaged var itemID: Int16
    @NSManaged var itemDescription: String
    @NSManaged var itemUIType: String
    
    enum CodingKeys: String, CodingKey {
        case itemDescription
        case itemUIType
        case startDate
        case endDate
        case itemID
    }
    
    
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    init(from decoder: Decoder) throws {
        guard let
            entityDescription = NSEntityDescription.entity(forEntityName: "Goals", in: PersistenceManager.shared.context)
            else { fatalError() }
        
        super.init(entity:entityDescription, insertInto:PersistenceManager.shared.context)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        itemID = try values.decode(Int16.self, forKey:.itemID)
        itemDescription = try values.decode(String.self, forKey:.itemDescription)
        itemUIType = try values.decode(String.self, forKey:.itemUIType)
        startDate = try values.decode(Date.self, forKey:.startDate)
        endDate = try values.decode(Date.self, forKey:.endDate)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(itemID, forKey: .itemID)
        try container.encode(itemDescription, forKey: .itemDescription)
        try container.encode(itemUIType, forKey: .itemUIType)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(endDate, forKey: .endDate)
    }
}



