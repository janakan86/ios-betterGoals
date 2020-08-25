//
//  Scheduler.swift
//  betterGoals
//
//  Created by K Janakan on 5/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI


struct Scheduler: View {
    @Environment(\.managedObjectContext) var sharedManagedContext
    
    @State var orientation: UIDeviceOrientation = UIDevice.current.orientation
    
    @State var displayOption = 1
    var options = ["Monthly", "Weekly"]
    
    var currentMonthProperties = DateDisplayCalculations.getCurrentMonthProperties()
    
    
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
                
               
                
                Group{
                    //monthly view
                    if displayOption == 0{
                        if(orientation.isLandscape){
                            ScrollView{
                                MonthlyView(displayedMonth: currentMonthProperties,
                                            retrievedScheduledItems: RetrievedScheduledItems(
                                                scheduledItems: DataService.sharedDataService.getScheduledItems(
                                                    forMonthProperties:currentMonthProperties,
                                                    inContext: sharedManagedContext))
                                )
                            }
                        }
                        else{
                             MonthlyView(displayedMonth: currentMonthProperties,
                                         retrievedScheduledItems: RetrievedScheduledItems(
                                            scheduledItems: DataService.sharedDataService.getScheduledItems(
                                                forMonthProperties:currentMonthProperties,
                                                inContext: sharedManagedContext))
                            )
                        }
                       
                    }
                        
                    //weekly view
                    else if displayOption == 1{
                        WeeklyView( weekStartDate: DateDisplayCalculations.firstDayOfWeek(forDate: Date()),
                                    scheduledItems:
                                RetrievedScheduledItems(scheduledItems: DataService.sharedDataService.getScheduledItems(
                                    between:  DateDisplayCalculations.firstDayOfWeek(forDate: Date()),
                                    and: DateDisplayCalculations.getFollowingDay(withOffset: 6, forDate:DateDisplayCalculations.firstDayOfWeek(forDate: Date())),
                                    inContext: sharedManagedContext
                                )))
                    }
                    
                }
                .frame(minWidth: 0,
                             maxWidth: .infinity,
                             minHeight: 0,
                             maxHeight: .infinity,
                             alignment: .topLeading)
             
                
                
                
                
                
            }.navigationBarTitle("Scheduler",displayMode: .inline)
        }.navigationBarColor(backgroundColor: UIColor(named:"pink") ?? .orange, tintColor: .white)
        
    }
       
}






struct Scheduler_Previews: PreviewProvider {
    static var previews: some View {
        Scheduler()
    }
}
