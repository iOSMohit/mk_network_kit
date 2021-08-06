//
//  UITextField+Extension.swift
//  ReadList
//
//  Created by Mohit Kumar on 20/01/21.
//

import Foundation
import UIKit

public extension UITextField{
    
    func isNilOrBlank()->Bool{
        if let text = self.text,text.replacingOccurrences(of: " ", with: "").count != 0{
            return false
        }
        
        return true
    }
}
