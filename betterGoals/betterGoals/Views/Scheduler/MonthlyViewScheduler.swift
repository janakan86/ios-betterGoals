//
//  MonthlyViewScheduler.swift
//  betterGoals
//
//  Created by K Janakan on 12/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct MonthlyView: View {
    
    @State var displayedMonth:MonthProperties
    
    @State var retrievedScheduledItems:RetrievedScheduledItems
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    
    
    var body: some View {
         
            VStack{
                
                HStack{
                    Text(displayedMonth.monthDescription)
                    
                    Text(String(displayedMonth.currentYear))
                }
                
                
                WeekForMonthlyView(startDayOfWeek: displayedMonth.monthStartDayofWeek,
                           startDateOfWeek: 1,
                           endDateOfWeek:   7-displayedMonth.monthStartDayofWeek+1,
                           retrievedScheduledItemDays: retrievedScheduledItems.getScheduledItemDaysOnly())
                            

                WeekForMonthlyView(startDayOfWeek:  1,
                           startDateOfWeek: (7-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:   (7-displayedMonth.monthStartDayofWeek)+8,
                           retrievedScheduledItemDays: retrievedScheduledItems.getScheduledItemDaysOnly())
                
                WeekForMonthlyView(startDayOfWeek:  1,
                           startDateOfWeek: (14-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:   (14-displayedMonth.monthStartDayofWeek)+8,
                           retrievedScheduledItemDays: retrievedScheduledItems.getScheduledItemDaysOnly())
                
                WeekForMonthlyView(startDayOfWeek:  1,
                           startDateOfWeek: (21-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:   min((21-displayedMonth.monthStartDayofWeek)+8,displayedMonth.noOfDays),
                           retrievedScheduledItemDays: retrievedScheduledItems.getScheduledItemDaysOnly())
                
                WeekForMonthlyView(startDayOfWeek:  1,
                           startDateOfWeek: (28-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:
                                min((28-displayedMonth.monthStartDayofWeek)+8,displayedMonth.noOfDays),
                           retrievedScheduledItemDays: retrievedScheduledItems.getScheduledItemDaysOnly())
                
                WeekForMonthlyView(startDayOfWeek:  1,
                           startDateOfWeek: (35-displayedMonth.monthStartDayofWeek)+2,
                           endDateOfWeek:
                                min((35-displayedMonth.monthStartDayofWeek)+8,displayedMonth.noOfDays),
                           retrievedScheduledItemDays: retrievedScheduledItems.getScheduledItemDaysOnly())
                
                
                HStack{
                    Button(action:{
                        self.displayedMonth = DateDisplayCalculations.getPreviousMonthProperties(currentMonth: self.displayedMonth)
                        
                        self.retrievedScheduledItems = RetrievedScheduledItems(
                            scheduledItems: DataService.sharedDataService.getScheduledItems(
                                forMonthProperties:self.displayedMonth,
                                inContext: self.sharedManagedContext))
                    }){
                         Image(systemName: "arrowtriangle.left.fill")
                                       .accentColor(Color("pink"))
                    }
                    
                    Button(action:{
                        self.displayedMonth = DateDisplayCalculations.getNextMonthProperties(currentMonth: self.displayedMonth)
                        
                        self.retrievedScheduledItems = RetrievedScheduledItems(
                        scheduledItems: DataService.sharedDataService.getScheduledItems(
                            forMonthProperties:self.displayedMonth,
                            inContext: self.sharedManagedContext))
                    }){
                        Image(systemName: "arrowtriangle.right.fill")
                                        .accentColor(Color("pink"))
                    }
                }
                
                
            }
         
       
    }
}


struct WeekForMonthlyView: View{
    
    var startDayOfWeek:Int
    var startDateOfWeek:Int
    var endDateOfWeek:Int
    
    var retrievedScheduledItemDays:[Bool]
    
    var dayPlacements = [0,1,2,3,4,5,6]
    
    var body: some View {
        HStack{
           
            ForEach(dayPlacements,id:\.self){ location in

                Group{
                    if (location+1 < self.startDayOfWeek) ||
                        (((self.endDateOfWeek-self.startDateOfWeek) < location) && self.startDayOfWeek == 1)
                    {
                        DayForMonthlyView(dateToDisplay: 0,isTaskScheduled: false).hidden()
                    }
                    else{
                        DayForMonthlyView(dateToDisplay: self.startDateOfWeek+location-self.startDayOfWeek+1,
                                          isTaskScheduled: self.retrievedScheduledItemDays[self.startDateOfWeek+location-self.startDayOfWeek+1])
                    }
                }
                 
            }
            
        
        }
        .frame(maxWidth: .infinity)
        
    }
}

struct DayForMonthlyView: View {
    
    var dateToDisplay:Int
    var isTaskScheduled:Bool
    
    var body: some View {
        Text("00")
               .hidden()
               .background(isTaskScheduled ? Color("pink"): Color.white )
               .clipShape(Circle())
               .padding(.vertical, 7)
               .overlay(
                   Text(String(dateToDisplay))
               )
    }
}
