//
//  goalsHome.swift
//  betterGoals
//
//  Created by K Janakan on 1/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct goalsHomeView: View {
    var body: some View {
        VStack{
            
            Spacer().frame(height:10)
            
            HStack{
                ItemIconView(itemUIValues:ItemTypesUIDefaults.sportsGoalTypeUI,
                         itemName:"Meditation")
                   .padding(.leading,10)

                Spacer().frame(width:10)
                
                ItemIconView(itemUIValues:ItemTypesUIDefaults.sportsGoalTypeUI,
                         itemName:"Running")
                  .padding(.trailing,10)
            }
            
            Spacer().frame(height:10)
            
            HStack{
                ItemIconView(itemUIValues:ItemTypesUIDefaults.financialGoalTypeUI,
                         itemName:"Save money")
                   .padding(.leading,10)
                
                Spacer().frame(width:10)
                
             ItemIconView(itemUIValues:ItemTypesUIDefaults.sportsGoalTypeUI,
                      itemName:"Relax ")
                   .padding(.trailing,10)
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
