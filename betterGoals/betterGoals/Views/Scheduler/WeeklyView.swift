//
//  WeeklyView.swift
//  betterGoals
//
//  Created by K Janakan on 12/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI
import CoreData

struct WeeklyView: View {
    
    var weekStartDate:Date
    var today = Date()
    
    //items to be showed for this week
    @EnvironmentObject var scheduledItems:RetrievedScheduledItems
    
    
    var body: some View {
        
        ForEach(0...6, id: \.self){ index in
            
            
            WeeklyViewRow(dateToDisplay: DateDisplayCalculations.getFollowingDay(withOffset:index, forDate:self.weekStartDate),
                          isTaskScheduled: self.scheduledItems.isScheduledItemExist(
                                forDate: DateDisplayCalculations.getFollowingDay(withOffset:index, forDate:self.weekStartDate)))
            
        }
        
    }
}

struct WeeklyViewRow: View {
    
    var dateToDisplay:Date
    var isTaskScheduled:Bool
    
    var body: some View {
        HStack{
            
            Text(String(Calendar.current.component(.day, from: dateToDisplay )))
                .foregroundColor((Calendar.current.isDateInToday(dateToDisplay)) ? Color("pink"):Color(.black))
            
            Spacer()
            
            Text(DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: dateToDisplay )-1])
                .foregroundColor((Calendar.current.isDateInToday(dateToDisplay)) ? Color("pink"):Color(.black))
            
            Text("00")
                .hidden()
                .background(isTaskScheduled ? Color("pink"): Color.white)
                .clipShape(Circle())
                .padding(.vertical, 7)
            
            
            
        }.padding(20)
    }
}


struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView(weekStartDate: DateDisplayCalculations.firstDayOfWeek(forDate: Date()))
    }
}
