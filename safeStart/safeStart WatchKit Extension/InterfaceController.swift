//
//  InterfaceController.swift
//  safeStart WatchKit Extension
//
//  Created by Shaheen Ghazazani on 2017-10-30.
//  Copyright © 2017 Shaheen Ghazazani. All rights reserved.
//
import Foundation
import WatchKit

class InterfaceController: WKInterfaceController {
    
    // MARK: - Outlets
    
    @IBOutlet var heartRateLabel: WKInterfaceLabel!
    @IBOutlet var controlButton: WKInterfaceButton!
    
    // MARK: - Properties
    
    private let workoutManager = WorkoutManager()
    
    // MARK: - Lifecycle
    
    override func willActivate() {
        super.willActivate()
        
        // Configure workout manager.
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

// MARK: - Workout Manager Delegate

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

