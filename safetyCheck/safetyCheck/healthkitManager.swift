//
//  permissions.swift
//  safetyCheck
//
//  Created by James McConnell on 2017-10-29.
//  Copyright © 2017 Shaheen Ghazazani. All rights reserved.
//

import Foundation
import HealthKit

class HelthkitManager{

    let healthStore: HKHealthStore? = {
        if HKHealthStore.isHealthDataAvailable() {
            return HKHealthStore()
        } else {
            return nil
        }
    }()

    func authorizeHealthkit() -> Bool{
        
        var isEnabled = true; //default assumption is the were authourized, will change in future
        
        if HKHealthStore.isHealthDataAvailable(){

            let heartRate = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)

            let dataTypesToRead = NSSet(object: heartRate!)
            let dataTypesToWrite = NSSet(object: heartRate!)


            healthStore?.requestAuthorization(toShare: nil, read: (dataTypesToRead as! Set<HKObjectType>)){
                (success, error) -> Void in
                isEnabled = success
            }
        }else{
            isEnabled = false
        }
            return isEnabled
        }
    }
