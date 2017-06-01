//
//  ChallengeManager.swift
//  ChallengeRPS
//
//  Created by Itsaraporn Chaichayanon on 6/1/2560 BE.
//  Copyright © 2560 ItsaraChai. All rights reserved.
//

import UIKit

class ChallengeManager: NSObject {

    private var mChallenge: Challenge?
    private static var mChallengeManager: ChallengeManager?
    static func sharedInstance() -> ChallengeManager {
        if (mChallengeManager == nil) {
            mChallengeManager = ChallengeManager()
        }
        return ChallengeManager.mChallengeManager!
    }
    
    func log(inputFileName: String) {
        /*
         Read Input File
         */
        guard let rawText = LocalFileManager.readFile(fileName: inputFileName) else {
            GlobalFunction.log(message: "Input file cannot read")
            return
        }
        /*
         Parse Input File
         */
        mChallenge = Challenge(rawText: rawText)
        if let challenge = mChallenge {
            if let invalidDataMessage = challenge.invalidData() {
                GlobalFunction.log(header: invalidDataMessage)
            }
            else {
                GlobalFunction.log(header: "Input", message: rawText)
                GlobalFunction.log(header: "Output", message: challenge.output)
            }
        }
        else {
            GlobalFunction.log(message: "Wrong input format")
        }
        mChallenge = nil
    }
}
