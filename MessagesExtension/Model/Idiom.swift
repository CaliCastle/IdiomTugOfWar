//
//  Idiom.swift
//  IdiomTugOfWar
//
//  Created by Cali Castle on 19/09/2016.
//  Copyright © 2016 Cali Castle. All rights reserved.
//

import UIKit

class Idiom: NSObject {
    
    static let queryItemKey = "Idiom"
    
    weak var delegate: IdiomDelegate?
    
    class func checkValidity(for value: String, _ delegatable: IdiomDelegate) {
        APIClient.shared.request(for: value) { (valid) in
            delegatable.validityChecked(valid: valid)
        }
    }
}

protocol IdiomDelegate: class {
    func validityChecked(valid: Bool)
}
