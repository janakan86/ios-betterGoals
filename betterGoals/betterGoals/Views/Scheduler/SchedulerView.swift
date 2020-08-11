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
                
                Group{
                    if displayOption == 0{
                        MonthlyView(displayedMonth: DateDisplayCalculations.getCurrentMonthProperties())
                    }
                    else if displayOption == 1{
                        Text("ttt")
                    }
                    
                }
                
                
                
                
            }.navigationBarTitle("Scheduler",displayMode: .inline)
        }.navigationBarColor(backgroundColor: UIColor(named:"pink") ?? .orange, tintColor: .white)
        
    }
       
}


struct MonthlyView: View {
    
    @State var displayedMonth:MonthProperties
    

    
    var body: some View {
         
            VStack{
                
                HStack{
                    Text(displayedMonth.monthDescription)
                    
                    Text(String(displayedMonth.currentYear))
                }
                
                
                WeeklyView(startDayOfWeek: displayedMonth.monthStartDayofWeek,
                           startDateOfWeek: 1,
                           endDateOfWeek:   7-displayedMonth.monthStartDayofWeek+1)
                
                WeeklyView(startDayOfWeek:  1,
                           startDateOfWeek: (7-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:   (7-displayedMonth.monthStartDayofWeek)+8)
                
                WeeklyView(startDayOfWeek:  1,
                           startDateOfWeek: (14-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:   (14-displayedMonth.monthStartDayofWeek)+8)
                
                WeeklyView(startDayOfWeek:  1,
                           startDateOfWeek: (21-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:   min((21-displayedMonth.monthStartDayofWeek)+8,displayedMonth.noOfDays))
                
                WeeklyView(startDayOfWeek:  1,
                           startDateOfWeek: (28-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:
                    min((28-displayedMonth.monthStartDayofWeek)+8,displayedMonth.noOfDays))
                
                WeeklyView(startDayOfWeek:  1,
                           startDateOfWeek: (35-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:
                    min((35-displayedMonth.monthStartDayofWeek)+8,displayedMonth.noOfDays))
                
                
                HStack{
                    Button(action:{
                        self.displayedMonth = DateDisplayCalculations.getPreviousMonthProperties(currentMonth: self.displayedMonth)
                    }){
                         Image(systemName: "arrowtriangle.left.fill")
                                       .accentColor(Color("pink"))
                    }
                    
                    Button(action:{
                        self.displayedMonth = DateDisplayCalculations.getNextMonthProperties(currentMonth: self.displayedMonth)
                    }){
                        Image(systemName: "arrowtriangle.right.fill")
                                        .accentColor(Color("pink"))
                    }
                }
                
                
            }
         
       
    }
}


struct WeeklyView: View{
    var startDayOfWeek:Int
    var startDateOfWeek:Int
    var endDateOfWeek:Int
    
    var dayPlacements = [0,1,2,3,4,5,6]
    
    var body: some View {
        HStack{
            
            ForEach(dayPlacements,id:\.self){ location in

                Group{
                    if (location+1 < self.startDayOfWeek) ||
                        (((self.endDateOfWeek-self.startDateOfWeek) < location) && self.startDayOfWeek == 1)
                    {
                        
                        DayView(dateToDisplay: 0).hidden()
                    }
                    else{
                        DayView(dateToDisplay: self.startDateOfWeek+location-self.startDayOfWeek+1)
                    }
                }
                 
            }
            
        
        }
        
    }
}

struct DayView: View {
    
    var dateToDisplay:Int
    
    var body: some View {
        Text("00")
               .hidden()
               .padding(8)
               .background(Color.white)
               .clipShape(Circle())
               .padding(.vertical, 4)
               .overlay(
                   Text(String(dateToDisplay))
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




struct DaysInWeek{
    
    
}

struct Scheduler_Previews: PreviewProvider {
    static var previews: some View {
        Scheduler()
    }
}
