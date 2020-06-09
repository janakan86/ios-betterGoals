//
//  ItemView.swift
//  betterGoals
//
//  Created by K Janakan on 1/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    

    
    var itemUIValues:ItemUIValues;
    var itemName:String
    
    
    var body: some View {
        
        VStack{
            
        Image(itemUIValues.defaultIcon)
             .resizable()
             .scaledToFit()
             .cornerRadius(15)
             .shadow(radius:4).overlay(
                ItemViewHeading(textValue: itemName,itemUIValues:itemUIValues),
                alignment: .topLeading)
        
        }
       
    }
}


struct ItemViewHeading : View {
    
    var textValue:String
    var itemUIValues:ItemUIValues
    
    var body: some View{
        Text(textValue)
            .foregroundColor(itemUIValues.color)
            .font(.title)
            .shadow(radius:1)
            .padding(.top,10)
            .padding(.leading,10)
        
        
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(itemUIValues:GoalTypesUIDefaults.sportsGoalTypeUI,itemName:"Meditation ")
            .offset(y:-130)
    }
}
