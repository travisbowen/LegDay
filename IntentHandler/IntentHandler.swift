//
//  IntentHandler.swift
//  IntentHandler
//
//  Created by Travis Bowen on 5/2/19.
//  Copyright © 2019 Travis Bowen. All rights reserved.
//

import Intents


class IntentHandler: INExtension, INStartWorkoutIntentHandling{
    
    func handle(intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        print("Start workout intent", intent)
        
        let userActivity: NSUserActivity? = nil
        
        guard let spokenPhrase = intent.workoutName?.spokenPhrase else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: userActivity))
            return
        }
        
        if spokenPhrase == "walk" || spokenPhrase == "run"{
            completion(INStartWorkoutIntentResponse(code: .handleInApp, userActivity: userActivity))
        } else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: userActivity))
        }
    }
}
