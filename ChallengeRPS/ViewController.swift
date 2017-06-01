//
//  ViewController.swift
//  ChallengeRPS
//
//  Created by Itsaraporn Chaichayanon on 5/31/17.
//  Copyright © 2017 ItsaraChai. All rights reserved.
//

import UIKit

let kFileChallengeName = "ChallengeRPS"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ChallengeManager.sharedInstance().log(inputFileName: kFileChallengeName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

