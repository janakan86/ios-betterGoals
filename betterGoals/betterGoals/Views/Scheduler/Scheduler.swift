//
//  Scheduler.swift
//  betterGoals
//
//  Created by K Janakan on 5/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct Scheduler: View {
    var body: some View {

        
        MonthlyView()
    }
}


struct MonthlyView: View {
    var body: some View {

        
        VStack{
            HStack{
                DayView()
                DayView()
                DayView()
                DayView()
                DayView()
            }
            HStack{
                DayView()
                DayView()
                DayView()
                DayView()
                DayView()
            }
            HStack{
                DayView()
                DayView()
                DayView()
                DayView()
                DayView()
            }
            HStack{
                DayView()
                DayView()
                DayView()
                DayView()
                DayView()
            }
            HStack{
                DayView()
                DayViewSelected()
                DayView()
                DayView()
                DayView()
            }
        }
    }
}


struct DayView: View {
    var body: some View {
        Text("00")
               .hidden()
               .padding(8)
               .background(Color.white)
               .clipShape(Circle())
               .padding(.vertical, 4)
               .overlay(
                   Text("15")
               )
    }
}

struct DayViewSelected: View {
    var body: some View {
        Text("00")
               .hidden()
               .padding(8)
               .background(Color.pink)
               .clipShape(Circle())
               .padding(.vertical, 4)
               .overlay(
                   Text("15")
               )
    }
}


struct Scheduler_Previews: PreviewProvider {
    static var previews: some View {
        Scheduler()
    }
}
