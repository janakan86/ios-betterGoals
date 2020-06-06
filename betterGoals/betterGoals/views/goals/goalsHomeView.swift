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
            HStack{
                ItemView(imageName:"piggybank",
                         itemName:"Meditation")
                   .padding(.leading,10)

                
                Spacer().frame(width:10)
                
                ItemView(imageName:"shoe",
                        itemName:"Meditation")
                  .padding(.trailing,10)
            }
            
            Spacer().frame(height:10)
            
            HStack{
                ItemView(imageName:"shoe",
                         itemName:"Meditation")
                   .padding(.leading,10)
                
                Spacer().frame(width:10)
                
                ItemView(imageName:"piggybank",
                        itemName:"Meditation")
                   .padding(.trailing,10)
            }

        }
        
        
        
    }
}

struct goalsHome_Previews: PreviewProvider {
    static var previews: some View {
        goalsHomeView()
    }
}
