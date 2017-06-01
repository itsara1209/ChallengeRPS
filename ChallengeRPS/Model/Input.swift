//
//  Input.swift
//  ChallengeRPS
//
//  Created by Itsaraporn Chaichayanon on 5/31/17.
//  Copyright © 2017 ItsaraChai. All rights reserved.
//

import Foundation

let kMESSAGE_CHALLANGE_NOT_TALLY = "Invalid input: Matches do not tally!"

class Input: NSObject {
    var numberOfMatch: Int = 0
    var match: [(Shape, Shape)] = []
    
    deinit {
        match.removeAll()
    }
    
    func invalidData() -> String? {
        if (numberOfMatch != match.count) { return kMESSAGE_CHALLANGE_NOT_TALLY }
        return nil
    }
}

