//
//  Date_Extensions.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/28/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public extension Date {
    
    /// Displays date a just day and month
    var simpleDateString : String {
        return self.toString(format: "MM/dd")
    }
    
    
    /// Displays date and time
    var dateWithTimeString : String {
        return self.toString(format: "MM/dd HH:mm a")
    }
    
    /// Easy string representation of the date
    ///
    /// - Parameter format: string format
    /// - Returns: string in format specified
    func toString( format : String ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// Gets the day of the week Integer of the day
    var dayOfTheWeek : Int {
        return Calendar.current.component(.weekday, from: self)
    }
}
