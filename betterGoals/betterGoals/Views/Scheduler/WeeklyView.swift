//
//  WeeklyView.swift
//  betterGoals
//
//  Created by K Janakan on 12/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import SwiftUI

struct WeeklyView: View {
    var weekStartDate:Date
    var today = Date()
    
    var body: some View {
        
        ForEach(0...6, id: \.self){ index in
           
          //  var DateDisplay = DateDisplayCalculations.getFollowingDay(withOffset:index, forDate:self.weekStartDate)
            Text(String(Calendar.current.component(.day,
            from: DateDisplayCalculations.getFollowingDay(withOffset:index, forDate:self.weekStartDate))))
        }
        
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView(weekStartDate: DateDisplayCalculations.firstDayOfWeek(forDate: Date()))
    }
}
