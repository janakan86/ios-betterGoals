//
//  ItemView.swift
//  betterGoals
//
//  Created by K Janakan on 1/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct ItemIconView: View {
    
    var itemUIValues:ItemUIValues;
    var itemName:String
    
    
    var body: some View {
        
        VStack{
            
        Image(itemUIValues.defaultIcon)
             .resizable()
             .scaledToFit()
             .cornerRadius(8)
             //.shadow(radius:4)
             .overlay(
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
            .padding(.top,10)
            .padding(.leading,10)
        
        
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemIconView(itemUIValues:ItemTypesUIDefaults.getItemUIDefault(usingUIName:              "financial"),itemName:"Meditation ")
            .offset(y:-130)
    }
}
