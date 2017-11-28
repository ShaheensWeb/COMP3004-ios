//
//  MockHeartRate.swift
//  safeStart
//
//  Created by Shaheen Ghazazani on 2017-11-28.
//  Copyright © 2017 Shaheen Ghazazani. All rights reserved.
//

import UIKit

class MockHeartRate: UIViewController {
    @IBOutlet weak var heartRate2: UILabel!
    @IBOutlet weak var heartRate1: UILabel!
    
    var heartRateInput1: String?
    var heartRateInput2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heartRate1.text = heartRateInput1
        heartRate2.text = heartRateInput2

        // Do any additional setup after loading the view.
    }
    
    func customInit(heartRate1: String, heartRate2: String){
        self.heartRateInput1 = heartRate1
        self.heartRateInput2 = heartRate2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
