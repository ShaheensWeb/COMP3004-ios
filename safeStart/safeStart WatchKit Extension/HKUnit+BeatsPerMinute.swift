//
//  HKUnit+BeatPerMinute.swift
//  safeStart WatchKit Extension
//
//  Created by Shaheen Ghazazani on 2017-10-30.
//  Copyright © 2017 Shaheen Ghazazani. All rights reserved.
//

import Foundation
import HealthKit

extension HKUnit {
    
    static func beatsPerMinute() -> HKUnit {
        return HKUnit.count().unitDivided(by: HKUnit.minute())
    }
    
}
