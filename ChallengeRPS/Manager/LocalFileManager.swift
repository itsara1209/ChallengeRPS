//
//  FileManager.swift
//  ChallengeRPS
//
//  Created by Itsaraporn Chaichayanon on 6/1/2560 BE.
//  Copyright © 2560 ItsaraChai. All rights reserved.
//

import Foundation

class LocalFileManager: NSObject {

    class func readFile(fileName: String) -> String? {
        guard let filePathUrl = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
            return nil
        }
        do {
            return try String(contentsOf: filePathUrl)
        }
        catch {
            return nil
        }
    }
}
