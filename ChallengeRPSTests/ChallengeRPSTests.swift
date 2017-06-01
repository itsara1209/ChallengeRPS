//
//  ChallengeRPSTests.swift
//  ChallengeRPSTests
//
//  Created by Itsaraporn Chaichayanon on 5/31/17.
//  Copyright © 2017 ItsaraChai. All rights reserved.
//

import XCTest
@testable import ChallengeRPS

let kTEST_FILE_INPUT = "ChallengeRPS"
let kTEST_FILE_NOT_TALLY_1 = "Test1_ChallengeRPS_LessThan"
let kTEST_FILE_NOT_TALLY_2 = "Test2_ChallengeRPS_MoreThan"
let kTEST_FILE_NOT_TALLY_3 = "Test3_ChallengeRPS_Invalid_Format"

class ChallengeRPSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShapeLogic() {
        let scissor = "Scissor"
        let paper = "Paper"
        let rock = "Rock"
        
        let shapeRock = Shape(rawValue: rock)
        let shapePaper = Shape(rawValue: paper)
        let shapeScissor = Shape(rawValue: scissor)

        // Initial
        XCTAssertTrue(shapeScissor == .Scissor, "Shape: Scissor wrong")
        XCTAssertTrue(shapePaper == .Paper, "Shape: Paper wrong")
        XCTAssertTrue(shapeRock == .Rock, "Shape: Rock wrong")
        XCTAssertTrue(shapeRock != .Scissor, "Shape: Rock wrong")

        // Beats
        XCTAssertTrue(shapeScissor?.beats() == shapeRock, "Shape Beats: Scissor wrong")
        XCTAssertTrue(shapeRock?.beats() == shapePaper, "Shape Beats: Rock wrong")
        XCTAssertTrue(shapePaper?.beats() == shapeScissor, "Shape Beats: Paper wrong")
        XCTAssertTrue(shapeScissor?.beats() != shapePaper, "Shape Beats: Scissor wrong")

        // Result Message
        XCTAssertTrue(shapeScissor?.beatsResult(competitorShape: shapeScissor!) == kBEATS_RESULT_DRAW, "Shape Result: Scissor wrong")
        XCTAssertTrue(shapePaper?.beatsResult(competitorShape: shapeRock!) == kBEATS_RESULT_WIN_PLAYER1, "Shape Result: Paper wrong")
        XCTAssertTrue(shapePaper?.beatsResult(competitorShape: shapeScissor!) == kBEATS_RESULT_WIN_PLAYER2, "Shape Result: Paper wrong")
        XCTAssertTrue(shapeRock?.beatsResult(competitorShape: shapePaper!) == kBEATS_RESULT_WIN_PLAYER2, "Shape Result: Rock wrong")
        XCTAssertTrue(shapeRock?.beatsResult(competitorShape: shapeScissor!) == kBEATS_RESULT_WIN_PLAYER1, "Shape Result: Rock wrong")
    }
    
    func testChallengeReadFile() {
        XCTAssertNil(LocalFileManager.readFile(fileName: "ChallengeRPS--"), "LocalFileManager.readFile failed")
        XCTAssertNotNil(LocalFileManager.readFile(fileName: "ChallengeRPS"), "LocalFileManager.readFile failed")
        XCTAssertNotNil(LocalFileManager.readFile(fileName: kTEST_FILE_NOT_TALLY_1), "LocalFileManager.readFile failed")
        XCTAssertNotNil(LocalFileManager.readFile(fileName: kTEST_FILE_NOT_TALLY_2), "LocalFileManager.readFile failed")
    }
    
    func testChallengeValid() {
        let expect = "Draw\nPlayer 1 wins\nPlayer 2 wins\nDraw\nPlayer 2 wins\n"
        // Valid
        let challengeValid = Challenge(rawText: LocalFileManager.readFile(fileName: kTEST_FILE_INPUT)!)
        XCTAssertNotNil(challengeValid, "ChallengeManager valid failed")
        XCTAssertTrue(challengeValid?.invalidData() == nil, "ChallengeManager invalidData failed")
        XCTAssertTrue(challengeValid?.output == expect, "ChallengeManager invalidData failed")

        // Invalid : LessThan
        let dataInValid1 = LocalFileManager.readFile(fileName: kTEST_FILE_NOT_TALLY_1)!
        let challengeInValid1 = Challenge(rawText: dataInValid1)
        XCTAssertNotNil(challengeInValid1, "ChallengeManager valid failed")
        XCTAssertTrue(challengeInValid1?.invalidData() == kMESSAGE_CHALLANGE_NOT_TALLY, "ChallengeManager invalidData failed")

        // Invalid : MoreThan
        let dataInValid2 = LocalFileManager.readFile(fileName: kTEST_FILE_NOT_TALLY_2)!
        let challengeInValid2 = Challenge(rawText: dataInValid2)
        XCTAssertNotNil(challengeInValid2, "ChallengeManager valid failed")
        XCTAssertTrue(challengeInValid2?.invalidData() == kMESSAGE_CHALLANGE_NOT_TALLY, "ChallengeManager invalidData failed")
        
        // Invalid : Invalid Format
        let dataInValid3 = LocalFileManager.readFile(fileName: kTEST_FILE_NOT_TALLY_3)!
        let challengeInValid3 = Challenge(rawText: dataInValid3)
        XCTAssertNil(challengeInValid3, "ChallengeManager valid failed")
    }
    
    func testChallengeLog() {
        ChallengeManager.sharedInstance().log(inputFileName: kFileChallengeName)
        ChallengeManager.sharedInstance().log(inputFileName: kTEST_FILE_NOT_TALLY_1)
        ChallengeManager.sharedInstance().log(inputFileName: kTEST_FILE_NOT_TALLY_2)
        ChallengeManager.sharedInstance().log(inputFileName: kTEST_FILE_NOT_TALLY_3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
