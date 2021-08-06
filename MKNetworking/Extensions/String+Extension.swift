//
//  String+Extensio .swift
//  ReadList
//
//  Created by Mohit Kumar on 21/01/21.
//

import Foundation
import UIKit

let __firstpart1 = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,100}[A-Z0-9a-z])?"
let __serverpart1 = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,100}[A-Z0-9a-z])?\\.){1,5}"
let __emailRegex1 = __firstpart1 + "@" + __serverpart1 + "[A-Za-z]{2,8}"
let __emailPredicate1 = NSPredicate(format: "SELF MATCHES %@", __emailRegex1)

public extension String{
    
    func isValidEmail() -> Bool {
        return __emailPredicate1.evaluate(with: self)
    }
}

public extension String{
    
    func toDate(from dateFormat:DateFormat)->Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
}

public extension String{
    
    func isValidUrl () -> Bool {
        if let url = URL(string: self){
            return UIApplication.shared.canOpenURL(url)
        }
        
        return false
    }
}

