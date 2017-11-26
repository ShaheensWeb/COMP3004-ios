//
//  ViewController.swift
//  safeStart
//
//  Created by Shaheen Ghazazani on 2017-10-24.
//  Copyright © 2017 Shaheen Ghazazani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    
    @IBAction func startButton(_ sender: Any) {
    }
    @IBAction func stopButton(_ sender: Any) {
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate time's up.
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
            timerLabel.text = String(seconds)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
