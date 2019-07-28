//
//  Month.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/20/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import Foundation


/// Personal enum for a month with more features than the calandar component enum
public enum Month : Int {
    case january = 1, february, march, april, may, june, july, auguest, september, october, november, december
    
    public var name : String {
        switch self {
        case .january: return "January"
        case .february: return "February"
        case .march: return "March"
        case .april: return "April"
        case .may: return "May"
        case .june: return "June"
        case .july: return "July"
        case .auguest: return "August"
        case .september: return "September"
        case .october: return "October"
        case .november: return "November"
        case .december: return "December"
        }
    }
    
    public func days( for year : Int) -> Int {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: year, month: self.rawValue)
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        
        return numDays
    }
    
    static var currentMonth : Month {
        return Date().month
    }
    
    
    /// The next month ( does not adjust year )
    var next : Month {
        let nextIndex = ((self.rawValue + 12) % 12 ) + 1
        return Month(rawValue: nextIndex)!
    }
    
    /// The previous month ( does not adjust year )
    var previous : Month {
        let previousIndex = ((self.rawValue + 10) % 12) + 1
        return Month(rawValue: previousIndex)!
    }
}

extension Date {
    public var month : Month {
        let month = Calendar.current.component(.month, from: self)
        return Month(rawValue: month)!
    }
}
