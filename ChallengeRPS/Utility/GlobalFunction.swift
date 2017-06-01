//
//  GlobalFunction.swift
//  ChallengeRPS
//
//  Created by Itsaraporn Chaichayanon on 6/1/2560 BE.
//  Copyright © 2560 ItsaraChai. All rights reserved.
//

import Foundation

class GlobalFunction {
    
    class func log(header: String = "Warning", message: String? = nil) {
        print("\(header)")
        guard let _message = message else { return }
        print("\(_message)")
    }
}
