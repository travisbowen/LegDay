//
//  WorkoutVC.swift
//  LegDay
//
//  Created by Travis Bowen on 5/1/19.
//  Copyright © 2019 Travis Bowen. All rights reserved.
//

import UIKit
import Intents


class WorkoutVC: UIViewController {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLabel.isHidden = true
        timerLabel.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSiriRequest), name: NSNotification.Name("workoutStartedNotification"), object: nil)
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == INSiriAuthorizationStatus.authorized{
                print("Authorized")
            } else {
                print("Unauthorized")
            }
        }
    }
    
    
    @objc func handleSiriRequest(){
        guard let intent = DataService.instance.startWorkoutIntent,
            let goalValue = intent.goalValue,
            let workoutType = intent.workoutName?.spokenPhrase else {
            
            timerLabel.isHidden = true
            typeLabel.isHidden = true
            return
        }
        
        timerLabel.isHidden = false
        typeLabel.isHidden = false
        typeLabel.text = "Type: \(workoutType.capitalized)"
        timerLabel.text = "\(goalValue.convertToClockTime()) left"
        
        return
    }
}

