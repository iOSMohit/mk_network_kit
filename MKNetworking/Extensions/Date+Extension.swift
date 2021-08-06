//
//  Date+Extension.swift
//  SocialApp
//
//  Created by Mohit Kumar on 01/11/20.
//  Copyright © 2021 Mohit. All rights reserved.
//

import Foundation

public enum DateFormat:String{
    case UI = "LLL dd, yyyy"
    case DDMMYYYY = "dd-MM-yyyy"
    case DDMMYYYY_FULL = "dd-MM-yyyy HH:mm:ss"
    case YYYYMMDD = "yyyy-MM-dd"
    case DDMMMYYYY = "dd-MMM-yyyy"
    case DDMMYYYYSECONDVERSION = "dd/MM/yyyy"
    case DDMMYYYYTHIRDVERSION = "MM/dd/yyyy"
    case Full = "mm/DD/yyyy HH:mm:ss"
    case FullVersionTwo = "dd/MM/yyyy HH:mm:ss"
    case FullVersionThree = "yyyy-MM-dd HH:mm:ss"
    case FullVersionFour = "d MMM yyyy h:mm a"
    case FullVersionFive = "d MMM yyyy"
    case FullVersionSeven = "MM/dd/yyyy HH:mm:ss"
    case Time = "HH:mm:ss"
    case TweleveTime = "h:mm a"
    case TwentyFourHour = "HH:mm"
    case DateMonth = "d MMM"
    case DayDateMonth = "d MMM, EEE"
    case DayDateFull = "EEE,d MMM yyyy"
    case FullVersionSix = "yyyy-MM-dd HH:mm:ss VV"
    case MMMMDDYYYY = "MMMM dd, yyyy"
}

public extension Date {
    var millisecondsSince1970: Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds: CLong) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    var milliSecondSince1970Int64:Int64{
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}

public extension Date{
    
    func toString(dateFormat:DateFormat)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        
        return dateFormatter.string(from: self)
    }
    
}

public extension Date{
    
    func toUnixTime()->TimeInterval{
        return self.timeIntervalSince1970
    }
}

public extension Date{
    
    func currentDateAsString(using dateFormat:DateFormat)->String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        
        return dateFormatter.string(from: currentDate)
    }
}
