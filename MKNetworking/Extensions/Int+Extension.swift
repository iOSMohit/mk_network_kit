//
//  Int+Extension.swift
//

import Foundation

public extension Int{
    
    func getBool()->Bool{
        if self == 1{
            return true
        }
        return false
    }
    
}

public extension String{
    
    func toInt()->Int{
        if let value = Int(self){
            return value
        }
        
        return -1
    }
}

public extension Optional where Wrapped == Int {
    
    func getInt()->Int{
        guard let text = self else {return 0}
        
        return text
    }
    
}

public extension Optional where Wrapped == Double {
    
    func getDouble()->Double{
        guard let text = self else {return Double(0)}
        
        return Double(text)
    }
    
}

public extension Int{
    
    func isZero()->Bool{
        if self == 0{
            return true
        }
        
        return false
    }
    
}

public extension Int {
    var ordinal: String {
        get {
            var suffix = "th"
            switch self % 10 {
                case 1:
                    suffix = "st"
                case 2:
                    suffix = "nd"
                case 3:
                    suffix = "rd"
                default: ()
            }
            if 10 < (self % 100) && (self % 100) < 20 {
                suffix = "th"
            }
            
            return String(self) + suffix
        }
    }
}

public extension Int{
    
    func toString()->String{
        return "\(self)"
    }
    
}
































































































































































































