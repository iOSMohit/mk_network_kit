//
//  NSDictionary+Extension.swift
//  ReadList
//
//  Created by Mohit Kumar on 19/01/21.
//

import Foundation

public extension NSDictionary{
    
    func getString(_ key:String)->String?{
        if let value = self[key] as? String{
            return value
        }
        
        return nil
    }
    
    func getDictionary(_ key:String)->NSDictionary?{
        return self[key] as? NSDictionary
    }
}
