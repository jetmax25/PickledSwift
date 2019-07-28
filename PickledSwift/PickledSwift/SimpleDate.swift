//
//  SimpleDate.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/20/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import Foundation
/// A date in terms of a day, month and year
struct SimpleDate {
    var month : Month
    var year : Int
    var day : Int {
        didSet {
            let range = self.month.days(for: self.year)
            if self.day > range {
                self.day = range
            } else if self.day == 0 {
                self.day = 1
            }
        }
    }
    
    
    /// Init by giving date parameters
    ///
    /// - Parameters:
    ///   - day: day of the month
    ///   - month: month of the date
    ///   - year: year of the date
    init ( day : Int, month : Month, year : Int ) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    
    /// Init using a standard date object
    ///
    /// - Parameter date: date to convert
    init( date : Date ) {
        let calendar = Calendar.current
        self.day = calendar.component(.day, from: date)
        self.year = calendar.component(.year, from: date)
        self.month = date.month
    }
}


extension SimpleDate : Comparable, Hashable {
    static func < (lhs: SimpleDate, rhs: SimpleDate) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        }
        
        if lhs.month != rhs.month {
            return lhs.month.rawValue < rhs.month.rawValue
        }
        
        return lhs.day < rhs.day
    }
    
    /// Number of days in the month of the date specified
    var daysInMonth : Int {
        return self.month.days(for: self.year)
    }
    
    /// The simple date today
    static var today : SimpleDate {
        return SimpleDate.init(date: Date())
    }
    
    
    /// Get the component before or after the specified date
    ///
    /// - Parameters:
    ///   - direction: direction to check, before or afterda
    ///   - component: date component to check, must be day month or year
    /// - Returns: the correlating SimpleDate specified
    func get( direction : Adjacent, component : Calendar.Component ) -> SimpleDate {
        var day : Int = self.day
        var month : Month = self.month
        var year : Int = self.year
        
        switch component {
        case .day: day += direction.rawValue
        case .year: year += direction.rawValue
        case .month:
            if direction == .next {
                month = self.month.next
                if month == .january {
                    year += 1
                }
            } else {
                month = self.month.previous
                if month == .december {
                    year -= 1
                }
            }
        default: fatalError()
        }
        
        return SimpleDate(day: day, month: month, year: year)
    }
    
    /// Checks if a simple date is today
    var isToday : Bool {
        return self == SimpleDate.today
    }
    
    
    /// If a simple date is in the past
    var isPast : Bool {
        return self < SimpleDate.today
    }
    
    /// If a simple date is in the future
    var isFuture: Bool {
        return self > SimpleDate.today
    }
    
    
    /// Gets the standard date from the simple date set at midnight
    var date : Date {
        var dateComponents = DateComponents()
        dateComponents.year = self.year
        dateComponents.month = self.month.rawValue
        dateComponents.day = self.day
        return Calendar.current.date(from: dateComponents)!
    }
}
