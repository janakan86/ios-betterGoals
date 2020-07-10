//
//  ItemTypeList.swift
//  betterGoals
//
//  Created by K Janakan on 6/7/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct ItemTypeList: View {
    

    
    @Environment(\.presentationMode) var presentationMode
    

    var listHeading:String
    var itemUIValues:[ItemUI] = ItemTypesUIDefaults.getAllItemUIValues()
    
    @EnvironmentObject var newGoal : Goal
    
    var body: some View {
        
        VStack{
            Text(self.listHeading).font(Font.system(size: 15, weight: .medium, design: .serif))
                .foregroundColor(Color("purple")).customStyle(style:Heading1Style())
            
            
            List(itemUIValues)
            { itemUIValue in
                
                HStack{
                    
                    Image(itemUIValue.defaultIcon)
                        .resizable()
                        .frame(width: 50, height: 50)

                    
                    Text(itemUIValue.name)
                        .foregroundColor(Color("pink"))
                        .font(.title)
                        .padding(.top,10)
                        .padding(.leading,10)
                    
                    Spacer()
                    
                    if(itemUIValue.id == self.newGoal.itemUIType){
                        
                        Image(systemName: "checkmark")
                            .imageScale(.medium)
                            .foregroundColor(Color("pink"))
                    }
                    
                }
                    
               
                .contentShape(Rectangle())//define tappable area
                    
                 //on tap, set the value for the shared goal object
                .onTapGesture {
                    self.newGoal.itemUIType = Int16(itemUIValue.id)
                }
                    
                //style
                .cornerRadius(6)
                .shadow(color:Color("lightPink"), radius: 1, x: 1, y: 1)
                
       
                
            }
            //hide the lines inbetween rows
            .onAppear { UITableView.appearance().separatorStyle = .none }
            
            Button(action: {
                               self.presentationMode.wrappedValue.dismiss()
                           }) {
                               Text("OK")
                                   
                           }.foregroundColor(.green)
                           
                           
                           Spacer()
            
        }
        
        
    }
    
}

 
struct ItemTypeList_Previews: PreviewProvider {
    static var previews: some View {
        ItemTypeList(listHeading: "test")
        
    }
}
