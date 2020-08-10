//
//  DateDisplayCalculations.swift
//  betterGoals
//
//  Created by K Janakan on 5/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation


class DateDisplayCalculations{
    func getCurrentMonth()->Int{
        return Calendar.current.component(.month, from: Date())
    }

    func getCurrentYear()->Int{
        return Calendar.current.component(.year, from: Date())
    }


    static func getDayofWeek(forDate:Date)->Int{
        return Calendar.current.component(.weekday, from: forDate)
    }
    
    
    static func firstDayOfMonth(forDate:Date)-> Date {
        let calendar = Calendar.current
        let forDateDayValue = calendar.component(.day, from: forDate)
    
         return Calendar.current.date(byAdding: .day, value: (-1 * forDateDayValue+1), to: forDate)!
     }


    static func getNumberOfDaysInMonth(forDate:Date)->Int{
        let range = Calendar.current.range(of: .day, in: .month, for: forDate)!
        return range.count
    }
    
    static func getTheDayofWeekforFirstDayofMonth(forDate:Date)->Int{
        return getDayofWeek(forDate: firstDayOfMonth(forDate:forDate))
    }

    static func getCurrentMonthProperties() -> MonthProperties{
        let noOfDays = getNumberOfDaysInMonth(forDate:Date())
        let monthStartDayofWeek = getTheDayofWeekforFirstDayofMonth(forDate:Date())
        
        return MonthProperties(noOfDays:noOfDays, monthStartDayofWeek:monthStartDayofWeek)
    }
}





struct MonthProperties{
    var noOfDays:Int
    var monthStartDayofWeek:Int //The day of the week in which the month starts
}
