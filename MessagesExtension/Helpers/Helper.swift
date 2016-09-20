//
//  Helper.swift
//  IdiomTugOfWar
//
//  Created by Cali Castle on 19/09/2016.
//  Copyright © 2016 Cali Castle. All rights reserved.
//

import Foundation

func convertStringToDictionary(text: String) -> [String:AnyObject]? {
    if let data = text.data(using: String.Encoding.utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
        } catch let error as NSError {
            print(error)
        }
    }
    return nil
}

func convertDataToDictionary(data: Data) -> [String:AnyObject]? {
    do {
        return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
    } catch let error {
        fatalError(error.localizedDescription)
    }
}
