//
//  Challenge.swift
//  IdiomTugOfWar
//
//  Created by Cali Castle on 20/09/2016.
//  Copyright © 2016 Cali Castle. All rights reserved.
//

import Foundation
import Messages

/// Challenge status enum.
///
/// - pending: The challenge is still pending.
/// - won:     I won the challenge.
/// - lost:    I lost the challenge.
public enum ChallengeStatus: UInt {
    
    case pending
    
    case won
    
    case lost
}

struct Challenge {
    
    var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()
        
        items = [URLQueryItem(name: Idiom.queryItemKey, value: lastIdiom)]
        
        return items
    }
    
    var status: ChallengeStatus = .pending
    
    var lastIdiom: String?
    
    init?(queryItems: [URLQueryItem]) {
        for queryItem in queryItems {
            guard let value = queryItem.value else { continue }
            
            if queryItem.name == Idiom.queryItemKey {
                lastIdiom = value
            } else {
                
            }
        }
    }
}

extension Challenge {
    init() {
        
    }
    
    init?(message: MSMessage?) {
        guard let messageUrl = message?.url else { return nil }
        guard let urlComponents = NSURLComponents(url: messageUrl, resolvingAgainstBaseURL: false), let queryItems = urlComponents.queryItems else {
            return nil
        }
        
        self.init(queryItems: queryItems)
    }
}
