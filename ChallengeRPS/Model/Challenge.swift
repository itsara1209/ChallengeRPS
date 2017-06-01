//
//  Challenge.swift
//  ChallengeRPS
//
//  Created by Itsaraporn Chaichayanon on 5/31/17.
//  Copyright © 2017 ItsaraChai. All rights reserved.
//

import Foundation

let kBEATS_RESULT_DRAW = "Draw"
let kBEATS_RESULT_WIN_PLAYER1 = "Player 1 wins"
let kBEATS_RESULT_WIN_PLAYER2 = "Player 2 wins"

enum Shape : String {
    case Scissor = "Scissor"
    case Paper = "Paper"
    case Rock = "Rock"
    
    func beats() -> Shape {
        switch self {
        case .Scissor: return .Rock
        case .Paper: return .Scissor
        case .Rock: return .Paper
        }
    }
    
    func beatsResult(competitorShape: Shape) -> String {
        if (self == competitorShape) { return kBEATS_RESULT_DRAW }
        else if (self.beats() == competitorShape) { return kBEATS_RESULT_WIN_PLAYER2 }
        else { return kBEATS_RESULT_WIN_PLAYER1 }
    }
}

class Challenge: NSObject {
    var input: Input? = Input()
    var output: String = ""
    
    deinit {
        output = ""
        input = nil
    }
    
    init?(rawText: String) {
        var seperateLines = rawText.components(separatedBy: "\n")
        if (seperateLines.count == 0) { return nil }
        guard let numberOfMatch = Int(seperateLines[0]) else { return nil }
        guard let _input = self.input else { return nil }
        _input.numberOfMatch = numberOfMatch

        /*
         Remove First & Last Line (\n)
         */
        seperateLines.remove(at: 0)
        seperateLines.remove(at: seperateLines.count-1)
        
        /*
         Collect Data
         */
        for value in seperateLines {
            let separated = value.components(separatedBy: " ")
            if (separated.count == 2)
                , let shape1 = Shape(rawValue: separated[0])
                , let shape2 = Shape(rawValue: separated[1]) {
                
                _input.match.append((shape1, shape2))
                self.output = self.output.appending("\(shape1.beatsResult(competitorShape: shape2))\n")
            }
            else {
                return nil
            }
        }
    }
    
    func invalidData() -> String? {
        if let _input = self.input, let warning = _input.invalidData() { return warning }
        return nil
    }
}
