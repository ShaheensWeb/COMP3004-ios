//
//  InterfaceController.swift
//  safeStart WatchKit Extension
//
//  Created by Shaheen Ghazazani on 2017-10-24.
//  Copyright © 2017 Shaheen Ghazazani. All rights reserved.
//

import WatchKit
import WatchConnectivity

class InterfaceController: WKInterfaceController{
    @IBOutlet var heartRateLabel: WKInterfaceLabel!
    @IBOutlet var controlButton: WKInterfaceButton!
    
    private let workoutManager = WorkoutManager()
    override func willActivate() {
        super.willActivate()
        workoutManager.delegate = self
    }
    
    @IBAction func didTapButton() {
        switch workoutManager.state {
        case .started:
            // Stop current workout.
            workoutManager.stop()
            break
        case .stopped:
            // Start new workout.
            workoutManager.start()
            break
        }
    }

}

extension InterfaceController: WorkoutManagerDelegate {
    
    func workoutManager(_ manager: WorkoutManager, didChangeStateTo newState: WorkoutState) {
        // Update title of control button.
        controlButton.setTitle(newState.actionText())
    }
    
    func workoutManager(_ manager: WorkoutManager, didChangeHeartRateTo newHeartRate: HeartRate) {
        // Update heart rate label.
        heartRateLabel.setText(String(format: "%.0f", newHeartRate.bpm))
    }
    
}
