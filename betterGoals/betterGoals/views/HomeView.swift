//
//  tabView.swift
//  betterGoals
//
//  Created by K Janakan on 6/5/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct HomeView :View {
   
    
    @State private var tabSelection = 0
    
    var body:some View  {
        
        TabView(selection:$tabSelection){
            
            Text("Home page")
                .font(.title)
                .tabItem {
                    Text("home").font(.caption)
                }
                .tag(0)
            
            goalsHomeView()
                .font(.title)
                .tabItem{
                    Text("goals").font(.caption)
                }
                .tag(1)
            
            Text("habits")
                .font(.title)
                .tabItem{
                    Text("habits").font(.caption)
                }
                .tag(2)
            
            Text("Scheduler")
                .font(.title)
                .tabItem{
                    Text("Scheduler").font(.caption)
                }
                 .tag(3)
        }
    
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}