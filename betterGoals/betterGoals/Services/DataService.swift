//
//  DataService.swift
//  betterGoals
//
//  Created by K Janakan on 10/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation

class DataService{
    
    static let sharedDataService = DataService()
    
    
    func getGoals()-> [Goal]{
        
        //load sample data
        let goalsSampleData: [Goal] = self.load("sampleGoals.json")
        // end of loading sample data
        return goalsSampleData
    }





    
    //json loader code taken from SWIFT UI official tutorial
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename)")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename)")
        }
        
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "dd/MM/yyyy"
               decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            return try decoder.decode(T.self, from: data)
        } catch {
             fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

}

