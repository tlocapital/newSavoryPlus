//
//  OnCookViewController.swift
//  SavoryPlus
//
//  Created by Ted on 5/7/16.
//  Copyright © 2016 savoryplus.SavoryPlus. All rights reserved.
//

import UIKit

class OnCookViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    var temperature: Float = 0
    var timeHour: Int = 0
    var timeMinute: Int = 0
    var timeSecond: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(OnCookViewController.countDown), userInfo: nil, repeats: true)
        tempLabel.text = "烹飪溫度 " + String(temperature) + " 度"
        timeLabel.text = " 剩餘時間 : \(timeHour) 小時 \(timeMinute) 分鐘"
        // Do any additional setup after loading the view.
    }
    
    func countDown() -> () {
        
        timeLabel.text = " 剩餘時間 : \(timeHour) 小時 \(timeMinute) 分鐘 \(timeSecond) 秒鐘"
        if timeSecond == 0 {
            if timeMinute == 0 {
                if timeHour == 0 {
                    return
                } else {
                    timeHour -= 1
                    timeMinute = 59
                }

            } else {
                timeMinute -= 1
                timeSecond = 59
            }
        } else {
            timeSecond -= 1
        }
        
        timeLabel.reloadInputViews()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
