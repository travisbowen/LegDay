//
//  DoubleExt.swift
//  LegDay
//
//  Created by Travis Bowen on 5/2/19.
//  Copyright © 2019 Travis Bowen. All rights reserved.
//

import Foundation

extension Double{
    
    func convertToClockTime() -> String{
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%0d:%02d", minutes, seconds)
    }
}
