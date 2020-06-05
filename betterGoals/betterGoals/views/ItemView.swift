//
//  ItemView.swift
//  betterGoals
//
//  Created by K Janakan on 1/6/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    
    var imageName:String
    var itemName:String
    
    
    var body: some View {
 
       Image(imageName)
        .resizable()
        .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,
                                     lineWidth: 4))
            .shadow(radius:10)
       
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(imageName:"shoe",itemName:"Meditation")
            .offset(y:-130)
    }
}
