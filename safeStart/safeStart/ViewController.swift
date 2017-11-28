//
//  ViewController.swift
//  safeStart
//
//  Created by Shaheen Ghazazani on 2017-10-24.
//  Copyright © 2017 Shaheen Ghazazani. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession){
        
    }
    func sessionDidDeactivate(_ session: WCSession){
        
    }
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?){
    }
    @IBOutlet weak var timerLabel: UILabel!
    var seconds = 3
    var timer = Timer()
    var isTimerRunning = false
    var lastMessage: CFAbsoluteTime = 0
    var heartRate1 = 0
    var heartRate2 = 0
    @IBOutlet weak var labelHeartRate1: UITextField!
    @IBOutlet weak var labelHeartRate2: UITextField!
    
    @IBAction func submitDataButton(_ sender: Any) {
        print("boooo")
        let heartRate1 :Int? = Int(labelHeartRate1.text!)
        let heartRate2 :Int? = Int(labelHeartRate2.text!)
        print("Here %d %d", (heartRate1, heartRate2))
    }
    
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            if WCSession.isSupported() { // check if the device support to handle an Apple Watch
                let session = WCSession.default()
                session.delegate = self
                session.activate() // activate the session
                
                if session.isPaired { // Check if the iPhone is paired with the Apple Watch
                    sendWatchMessage()
                    print("hi")
                }
            }
            runTimer()
            //.setTitle(newState.actionText())
        }
        sender.isHidden = true
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            self.performSegue(withIdentifier: "timerEndSegue", sender: nil)
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
            timerLabel.text = String(seconds)
        }
    }
    
    @IBOutlet weak var timerLabel2: UILabel!
    var seconds2 = 5
    var timer2 = Timer()
    var isTimerRunning2 = false
    
    @IBAction func startButtonTapped2(_ sender: UIButton) {
        if isTimerRunning2 == false {
            runTimer2()
        }
        sender.isHidden = true
    }
    func runTimer2() {
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer2)), userInfo: nil, repeats: true)
        isTimerRunning2 = true
    }
    @objc func updateTimer2() {
        if seconds2 < 1 {
            timer2.invalidate()
            self.performSegue(withIdentifier: "resultsSegue", sender: nil)
        } else {
            seconds2 -= 1
            timerLabel2.text = timeString(time: TimeInterval(seconds2))
            timerLabel2.text = String(seconds2)
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendWatchMessage() {
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        // if less than half a second has passed, bail out
        if lastMessage + 0.5 > currentTime {
            return
        }
        
        // send a message to the watch if it's reachable
        if (WCSession.default().isReachable) {
            // this is a meaningless message, but it's enough for our purposes
            let message = ["Message": "Hello"]
            WCSession.default().sendMessage(message, replyHandler: nil)
        }
        
        // update our rate limiting property
        lastMessage = CFAbsoluteTimeGetCurrent()
    }
}
