//
//  Scheduler.swift
//  betterGoals
//
//  Created by K Janakan on 5/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI


struct Scheduler: View {
    @State var displayOption = 0
    var options = ["Monthly", "Weekly"]
    
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                Picker("DisplayOption", selection: $displayOption) {
                    ForEach(0 ..< options.count) { index in
                        Text(self.options[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top,20)
                
                Spacer()
                
                Group{
                    if displayOption == 0{
                        MonthlyView(displayedMonth: DateDisplayCalculations.getCurrentMonthProperties())
                    }
                    else if displayOption == 1{
                        WeeklyView(weekStartDate: DateDisplayCalculations.firstDayOfWeek(forDate: Date()))
                    }
                    
                }
                
                
                
                
            }.navigationBarTitle("Scheduler",displayMode: .inline)
        }.navigationBarColor(backgroundColor: UIColor(named:"pink") ?? .orange, tintColor: .white)
        
    }
       
}






struct Scheduler_Previews: PreviewProvider {
    static var previews: some View {
        Scheduler()
    }
}
