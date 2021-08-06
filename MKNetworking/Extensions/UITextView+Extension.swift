//
//  UITextView+Extension.swift
//  ReadList
//
//  Created by Mohit Kumar on 22/02/21.
//

import Foundation
import UIKit

public extension UITextView{
    
    func isNilOrBlank()->Bool{
        if let text = self.text,text.replacingOccurrences(of: " ", with: "").count != 0{
            return false
        }
        
        return true
    }
}
