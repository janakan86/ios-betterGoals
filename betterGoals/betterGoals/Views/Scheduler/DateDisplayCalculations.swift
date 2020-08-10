//
//  DateDisplayCalculations.swift
//  betterGoals
//
//  Created by K Janakan on 5/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation

extension Date{
    static var firstDayOfCurrentMonth:Date {   return Date().firstDayOfCurrentMonth   }
    
    
    var firstDayOfCurrentMonth: Date {
         let calendar = Calendar.current
         let today = calendar.component(.day, from: Date())
         return Calendar.current.date(byAdding: .day, value: (-1 * today+1), to: Date())!
     }
    
}


func getCurrentMonth()->Int{
    return Calendar.current.component(.month, from: Date())
}

func getCurrentYear()->Int{
    return Calendar.current.component(.year, from: Date())
}


func getDayofWeek(forDate:Date)->Int{
    return Calendar.current.component(.weekday, from: forDate)
}


func getNumberOfDaysInCurrentMonth()->Int{
    let range = Calendar.current.range(of: .day, in: .month, for: Date())!
    return range.count
}
