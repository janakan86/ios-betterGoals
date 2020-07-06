//
//  ItemTypeList.swift
//  betterGoals
//
//  Created by K Janakan on 6/7/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct ItemTypeList: View {
    
    var itemUIValues:[ItemUI] = ItemTypesUIDefaults.getAllItemUIValues()
    
    var body: some View {
        
        List(itemUIValues)
        { itemUIValue in
            ItemTypeRow(itemUI: itemUIValue)
            
        }
    }
}

struct ItemTypeRow : View {
    
    var itemUI:ItemUI;
    
    var body: some View {
        
        HStack{
            
            Image(itemUI.defaultIcon)
                 .resizable()
                 .frame(width: 50, height: 50)
                 .cornerRadius(8)
                
            Text(itemUI.name)
                .foregroundColor(.black)
                .font(.title)
                .padding(.top,10)
                . padding(.leading,10)
            
        }
       
    }
}

struct ItemTypeList_Previews: PreviewProvider {
    static var previews: some View {
        ItemTypeList()
    }
}
