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
    var time = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tempLabel.text = String(temperature)
        timeLabel.text = String(time)
        // Do any additional setup after loading the view.
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
