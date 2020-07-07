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
            
            ItemTypeRow(itemUI: itemUIValue)
                .onTapGesture {
                    self.selectedItem = itemUIValue
                }
                .background(
                    self.selectedItem?.id == itemUIValue.id ? Color("lightPink") : Color(.white))
                .cornerRadius(6)
                .shadow(color:Color("lightPink"), radius: 1, x: 1, y: 1)
            
        }
        .onAppear { UITableView.appearance().separatorStyle = .none }
        
                    
                    
            
                
            
        }
    }


struct ItemTypeRow : View {
    
    var itemUI:ItemUI;
    
    var body: some View {
        
        HStack{
            
            Image(itemUI.defaultIcon)
                 .resizable()
                 .frame(width: 50, height: 50)
                 //.cornerRadius(8)
                
            Text(itemUI.name)
                .foregroundColor(Color("pink"))
                .font(.title)
                .padding(.top,10)
                .padding(.leading,10)
            
            Spacer()
            
        }
        .contentShape(Rectangle()) //makes the spacer clickable/ selectable
       
    }
}

struct ItemTypeList_Previews: PreviewProvider {
    static var previews: some View {
        ItemTypeList()
    }
}
