//
//  HelperUtil.swift
//  MKNetworking
//
//  Created by Mohit Kumar on 06/08/21.
//

import Foundation
 
public class HelperUtility {
    
    static func printDataToJSON(data:Data){
        if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
            print(JSONString)
        }
    }
}
