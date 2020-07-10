//
//  goalsHome.swift
//  betterGoals
//
//  Created by K Janakan on 1/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI
import CoreData

struct goalsHomeView: View {
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    var goals:[Goal] = []
    
    init(){
        goals = DataService.sharedDataService.getGoals(inContext : sharedManagedContext)
    }
    
    var body: some View {
        VStack{
            
            Spacer().frame(height:10)
            
            HStack{
                if goals.indices.contains(0){
                    ItemIconView(itemUIValues: ItemTypesUIDefaults.getItemUIDefault(usingID:              Int(goals[0].itemUIType)),itemName:goals[0].itemDescription)
                        .padding(.leading,10)
                    
                    Spacer().frame(width:10)
                }
                
                
                if goals.indices.contains(1){
                    ItemIconView(itemUIValues: ItemTypesUIDefaults.getItemUIDefault(usingID:              Int(goals[1].itemUIType)),itemName:goals[1].itemDescription)
                        .padding(.trailing,10)
                }
                
            }
                
            Spacer().frame(height:10)
            
            HStack{
                if goals.indices.contains(2){
                    ItemIconView(itemUIValues: ItemTypesUIDefaults.getItemUIDefault(usingID:              Int(goals[2].itemUIType)),itemName:goals[2].itemDescription)
                        .padding(.leading,10)
                    
                    Spacer().frame(width:10)
                }
                
                
                if goals.indices.contains(3){
                    ItemIconView(itemUIValues: ItemTypesUIDefaults.getItemUIDefault(usingID:              Int(goals[3].itemUIType)),itemName:goals[3].itemDescription)
                        .padding(.trailing,10)
                }
            }
            
            Spacer().frame(height:10)
        }
        
        
        
    }
}

struct goalsHome_Previews: PreviewProvider {
    static var previews: some View {
        goalsHomeView()
    }
}
