//
//  ViewController.swift
//  Timer
//
//  Created by Pao Mac PC on 19.03.16.
//  Copyright © 2016 Anat.Kant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    @IBAction func startButtonDidPressed(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerUpdate", userInfo: NSDate(), repeats: true)
       
        startButton.hidden = true
        stopButton.hidden = false
    }
    
    @IBAction func stopButtonDidPressed(sender: AnyObject) {
        timer.invalidate()
        timerLabel.text = "00"
        
        startButton.hidden = false
        stopButton.hidden = true
    }
    
    func timerUpdate() {
        
        let elapsed = -(self.timer.userInfo as! NSDate).timeIntervalSinceNow
        
        if elapsed < 60 {
            timerLabel.text = String(format: "%.02d", Int(elapsed))
        } else {
            timerLabel.text = String(format: "%.02d:%.02d", Int(elapsed) / 60, Int(elapsed) % 60)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startButton.hidden = false
        stopButton.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

