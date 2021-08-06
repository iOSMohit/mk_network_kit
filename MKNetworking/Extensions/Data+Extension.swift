//
//  Data+Extension.swift
//  ReadList
//
//  Created by Mohit Kumar on 28/01/21.
//

import Foundation
import UIKit

public extension Data{
    func toImage()->UIImage?{
        let image = UIImage(data: self, scale: 1.0)
        return image
    }
}
