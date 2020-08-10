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
        
        let currentYear = getCurrentYear()
        let month = getCurrentMonth()
        let monthDescription = DateFormatter().monthSymbols[month - 1]
        let noOfDays = getNumberOfDaysInMonth(forDate:Date())
        let monthStartDayofWeek = getTheDayofWeekforFirstDayofMonth(forDate:Date())
        
        
        return MonthProperties(month:month,monthDescription:monthDescription,
                               noOfDays:noOfDays, monthStartDayofWeek:monthStartDayofWeek,currentYear:currentYear)
    }
    
    
    static func getNextMonthProperties(currentMonth:MonthProperties)->MonthProperties{
        
        let nextMonth =  currentMonth.month == 12 ? (1) : currentMonth.month + 1
        let year = currentMonth.month == 12 ? currentMonth.currentYear + 1 : currentMonth.currentYear
        let monthDescription = DateFormatter().monthSymbols[nextMonth - 1]
        
        //construct the first day of next month
        let components = DateComponents(year: year, month: nextMonth, day: 1)
        let firstDayofNextMonth = Calendar.current.date(from: components)!
        
        let noOfDays = getNumberOfDaysInMonth(forDate: firstDayofNextMonth)
        let monthStartDayofWeek = getTheDayofWeekforFirstDayofMonth(forDate:firstDayofNextMonth)
        
        return MonthProperties(month:nextMonth,monthDescription:monthDescription,
                                     noOfDays:noOfDays, monthStartDayofWeek:monthStartDayofWeek,currentYear:year)
    }
    
    static func getPreviousMonthProperties(currentMonth:MonthProperties)->MonthProperties{
        
        let previousMonth =  currentMonth.month == 1 ? (12) : currentMonth.month - 1
        let year = currentMonth.month == 1 ? currentMonth.currentYear - 1 : currentMonth.currentYear
        let monthDescription = DateFormatter().monthSymbols[previousMonth - 1]
        
        //construct the first day of next month
        let components = DateComponents(year: year, month: previousMonth, day: 1)
        let firstDayofPreviousMonth = Calendar.current.date(from: components)!
        
        let noOfDays = getNumberOfDaysInMonth(forDate: firstDayofPreviousMonth)
        let monthStartDayofWeek = getTheDayofWeekforFirstDayofMonth(forDate:firstDayofPreviousMonth)
        
        return MonthProperties(month:previousMonth,monthDescription:monthDescription,
                                     noOfDays:noOfDays, monthStartDayofWeek:monthStartDayofWeek,currentYear:year)
    }
}





class MonthProperties: ObservableObject{
    
    init(month:Int,monthDescription:String,noOfDays:Int,monthStartDayofWeek:Int,currentYear:Int){
        self.noOfDays = noOfDays
        self.monthStartDayofWeek = monthStartDayofWeek
        self.month = month
        self.monthDescription = monthDescription
        self.currentYear = currentYear
        
    }
    
    var month:Int
    var monthDescription:String
    var currentYear:Int
    var noOfDays:Int
    var monthStartDayofWeek:Int //The day of the week in which the month starts
}
