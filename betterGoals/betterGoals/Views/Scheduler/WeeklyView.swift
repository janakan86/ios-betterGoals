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
    
    @State var weekStartDate:Date
    
    //items to be showed for this week
    @State var scheduledItems:RetrievedScheduledItems
    
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    
    var body: some View {
        
        VStack{
            
            HStack{
                Text(DateDisplayCalculations.getMonthDescription(forMonth: DateDisplayCalculations.getMonth(forDate: self.weekStartDate)))
                
                Text(String(DateDisplayCalculations.getYear(forDate: self.weekStartDate)))
            }
            
            ScrollView{
                ForEach(0...6, id: \.self){ index in
                    
                    
                    WeeklyViewRow(dateToDisplay: DateDisplayCalculations.getFollowingDay(withOffset:index, forDate:self.weekStartDate),
                                  isTaskScheduled: self.scheduledItems.isScheduledItemExist(
                                        forDate: DateDisplayCalculations.getFollowingDay(withOffset:index, forDate:self.weekStartDate)))
                    
                }
            }
            
            
            
            //Navigation buttons
            HStack{
                Button(action:{
                    self.weekStartDate = DateDisplayCalculations.getFollowingDay(withOffset: -7, forDate: self.weekStartDate)
                    self.scheduledItems =  RetrievedScheduledItems(scheduledItems: DataService.sharedDataService.getScheduledItems(
                                            between:  self.weekStartDate,
                                            and: DateDisplayCalculations.getFollowingDay(withOffset: -7, forDate: self.weekStartDate),
                                            inContext: self.sharedManagedContext))
                    
                }){
                     Image(systemName: "arrowtriangle.left.fill")
                                   .accentColor(Color("pink"))
                }
                
                Button(action:{
                   self.weekStartDate = DateDisplayCalculations.getFollowingDay(withOffset: 7, forDate: self.weekStartDate)
                   self.scheduledItems =  RetrievedScheduledItems(scheduledItems: DataService.sharedDataService.getScheduledItems(
                                             between:  self.weekStartDate,
                                             and: DateDisplayCalculations.getFollowingDay(withOffset: 7, forDate: self.weekStartDate),
                                             inContext: self.sharedManagedContext))

                }){
                    Image(systemName: "arrowtriangle.right.fill")
                                    .accentColor(Color("pink"))
                }
            }
            
            Spacer()
            
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
            
            
            
        }.padding(5)
    }
}

