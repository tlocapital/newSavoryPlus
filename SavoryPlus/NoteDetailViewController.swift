//
//  NoteDetailViewController.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/5/4.
//  Copyright © 2016年 savoryplus.SavoryPlus. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    @IBOutlet weak var labelTemporature: UILabel!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelTag: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    
    var note: [NoteData] = []
    var tagtag: Int = 0
    
    // MARK: Here herererere
    @IBAction func shareBut(sender: AnyObject) {

        let defaultText = "This looks good !"
        if let imageToShare = UIImage(named: self.note[tagtag].image) {
            let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            self.presentViewController(activityController, animated: true, completion: nil)
        }

        
    }
    
    @IBAction func setBut(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageFood.image = UIImage(named: self.note[tagtag].image)
        self.labelTemporature.text = self.note[tagtag].temperature
        self.labelTimer.text = self.note[tagtag].timer
        self.labelTag.text = self.note[tagtag].tag
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "setTempTime" {
            let destinationController = segue.destinationViewController as! OnCookViewController
            destinationController.timeMinute = Int(note[tagtag].timer)!
            destinationController.temperature = Float(note[tagtag].temperature)!
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
