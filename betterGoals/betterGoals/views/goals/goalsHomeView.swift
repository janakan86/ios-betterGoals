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
                ItemView(imageName:"shoe",
                         itemName:"Meditation")
                    .offset(y:-130)
                    .padding(.bottom,-130)
                
                Spacer()
                
            }

        }
    }
}

struct goalsHome_Previews: PreviewProvider {
    static var previews: some View {
        goalsHomeView()
    }
}
