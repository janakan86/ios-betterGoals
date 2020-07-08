//
//  ItemTypeList.swift
//  betterGoals
//
//  Created by K Janakan on 6/7/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct ItemTypeList: View {
    
    
    @State var selectedItem:ItemUI?
    
    var itemUIValues:[ItemUI] = ItemTypesUIDefaults.getAllItemUIValues()
    
    var body: some View {
        
        List(itemUIValues)
        { itemUIValue in
            
            HStack{
                
                Image(itemUIValue.defaultIcon)
                    .resizable()
                    .frame(width: 50, height: 50)
                //.cornerRadius(8)
                
                Text(itemUIValue.name)
                    .foregroundColor(Color("pink"))
                    .font(.title)
                    .padding(.top,10)
                    .padding(.leading,10)
                
                Spacer()
                
                if(itemUIValue.id == self.selectedItem?.id){
                    
                    Image(systemName: "checkmark")
                        .imageScale(.medium)
                        .foregroundColor(Color("pink"))
                }
                
            }
                
            //tap
            .contentShape(Rectangle())//define tappable area
            .onTapGesture {
                self.selectedItem = itemUIValue
            }
                
            //style
            .cornerRadius(6)
            .shadow(color:Color("lightPink"), radius: 1, x: 1, y: 1)
            
            
        }
            
        .onAppear { UITableView.appearance().separatorStyle = .none }
        
    }
    
}

 
struct ItemTypeList_Previews: PreviewProvider {
    static var previews: some View {
        ItemTypeList()
    }
}
