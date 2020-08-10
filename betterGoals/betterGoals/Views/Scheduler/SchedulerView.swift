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

        
        MonthlyView(currentMonth: DateDisplayCalculations.getCurrentMonthProperties())
    }
}


struct MonthlyView: View {
    
    var currentMonth:MonthProperties
    
    var body: some View {
        
        VStack{
            
            WeeklyView(startDayOfWeek: currentMonth.monthStartDayofWeek,
                       startDateOfWeek: 1,
                       endDateOfWeek:   7-currentMonth.monthStartDayofWeek+1)
            
            WeeklyView(startDayOfWeek:  1,
                       startDateOfWeek: (7-currentMonth.monthStartDayofWeek)+2,
                       endDateOfWeek:   (7-currentMonth.monthStartDayofWeek)+8)
            
            WeeklyView(startDayOfWeek:  1,
                       startDateOfWeek: (14-currentMonth.monthStartDayofWeek)+2,
                       endDateOfWeek:   (14-currentMonth.monthStartDayofWeek)+8)
            
            WeeklyView(startDayOfWeek:  1,
                       startDateOfWeek: (21-currentMonth.monthStartDayofWeek)+2,
                       endDateOfWeek:   min((21-currentMonth.monthStartDayofWeek)+8,currentMonth.noOfDays))
            
            WeeklyView(startDayOfWeek:  1,
                       startDateOfWeek: (28-currentMonth.monthStartDayofWeek)+2,
                       endDateOfWeek:
                            min((28-currentMonth.monthStartDayofWeek)+8,currentMonth.noOfDays))
            
            WeeklyView(startDayOfWeek:  1,
                       startDateOfWeek: (35-currentMonth.monthStartDayofWeek)+2,
                       endDateOfWeek:
                             min((35-currentMonth.monthStartDayofWeek)+8,currentMonth.noOfDays))
            
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
