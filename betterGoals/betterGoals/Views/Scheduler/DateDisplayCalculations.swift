//
//  DateDisplayCalculations.swift
//  betterGoals
//
//  Created by K Janakan on 5/8/20.
//  Copyright © 2020 K Janakan. All rights reserved.
//

import Foundation


class DateDisplayCalculations{
    static func getCurrentMonth()->Int{
        return Calendar.current.component(.month, from: Date())
    }

    static func getCurrentYear()->Int{
        return Calendar.current.component(.year, from: Date())
    }


    static func getDayofWeek(forDate:Date)->Int{
        return Calendar.current.component(.weekday, from: forDate)
    }
    
    
    static func firstDayOfMonth(forDate:Date)-> Date {
        let calendar = Calendar.current
        let forDateDayValue = calendar.component(.day, from: forDate)
    
        return calendar.date(byAdding: .day, value: (-1 * forDateDayValue+1), to: forDate)!
    }
    
    static func getLastDayOfMonth(forDate:Date)-> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1),
                                     to: DateDisplayCalculations.firstDayOfMonth(forDate: forDate))!
    }
    
    static func getLastDayOfMonth(withFirstDayofMonth forDate:Date)-> Date {
         return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1),
                                      to: forDate)!
     }
    
    static func getFollowingDay(withOffset offsetDays:Int, forDate:Date)-> Date {
        return Calendar.current.date(byAdding: .day, value: offsetDays, to: forDate)!
    }
    
    static func firstDayOfWeek(forDate:Date)-> Date {
        let calendar = Calendar.current
        let forDateWeekDayValue = calendar.component(.weekday, from: forDate)
    
        return Calendar.current.date(byAdding: .day, value: (-1 * forDateWeekDayValue+1), to: forDate)!
     }
    
    static func lastDayOfWeek(forDate:Date)-> Date {
         let calendar = Calendar.current
         let forDateWeekDayValue = calendar.component(.weekday, from: forDate)
     
         return Calendar.current.date(byAdding: .day, value: (7 - forDateWeekDayValue), to: forDate)!
      }


    static func getNumberOfDaysInMonth(forDate:Date)->Int{
        let range = Calendar.current.range(of: .day, in: .month, for: forDate)!
        return range.count
    }
    
    static func getTheDayofWeekforFirstDayofMonth(forDate:Date)->Int{
        return getDayofWeek(forDate: firstDayOfMonth(forDate:forDate))
    }

    static func getCurrentMonthProperties() -> MonthProperties{
        
        let currentYear = getCurrentYear()
        let month = getCurrentMonth()
        
        return MonthProperties(firstDayOfMonth:DateDisplayCalculations.firstDayOfMonth(forDate: Date()),month:month,currentYear:currentYear)
    }
    
    
    static func getNextMonthProperties(currentMonth:MonthProperties)->MonthProperties{
        
        let nextMonth =  currentMonth.month == 12 ? (1) : currentMonth.month + 1
        let year = currentMonth.month == 12 ? currentMonth.currentYear + 1 : currentMonth.currentYear

        //construct the first day of next month
        let components = DateComponents(year: year, month: nextMonth, day: 1)
        let firstDayofNextMonth = Calendar.current.date(from: components)!
        
        return MonthProperties(firstDayOfMonth:firstDayofNextMonth,month:nextMonth,currentYear:year)
    }
    
    static func getPreviousMonthProperties(currentMonth:MonthProperties)->MonthProperties{
        
        let previousMonth =  currentMonth.month == 1 ? (12) : currentMonth.month - 1
        let year = currentMonth.month == 1 ? currentMonth.currentYear - 1 : currentMonth.currentYear
        
        //construct the first day of previous month
        let components = DateComponents(year: year, month: previousMonth, day: 1)
        let firstDayofPreviousMonth = Calendar.current.date(from: components)!
        
        return MonthProperties(firstDayOfMonth:firstDayofPreviousMonth,month:previousMonth,currentYear:year)
    }
    
    

}


    


class MonthProperties: ObservableObject{
    
    
    init(firstDayOfMonth:Date, month:Int,currentYear:Int){
        self.noOfDays = DateDisplayCalculations.getNumberOfDaysInMonth(forDate: firstDayOfMonth)
        self.monthStartDayofWeek = DateDisplayCalculations.getTheDayofWeekforFirstDayofMonth(forDate:firstDayOfMonth)
        self.month = month
        self.monthDescription = DateFormatter().monthSymbols[month - 1]
        self.currentYear = currentYear
        self.firstDayOfMonth = firstDayOfMonth
        self.lastDayOfMonth = DateDisplayCalculations.getLastDayOfMonth(withFirstDayofMonth: firstDayOfMonth)
    }
    
    var month:Int
    var monthDescription:String
    var currentYear:Int
    var noOfDays:Int
    var monthStartDayofWeek:Int //The day of the week in which the month starts
    var firstDayOfMonth:Date
    var lastDayOfMonth:Date
    
}
