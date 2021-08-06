//
//  UIImage+Extension.swift
//  ReadList
//
//  Created by Mohit Kumar on 17/01/21.
//

import Foundation
import UIKit

public extension UIImage{
    
    func toData()->Data?{
        return self.pngData()
    }
}

public extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
