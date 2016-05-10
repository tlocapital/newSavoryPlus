//
//  NoteDetailViewController.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/5/4.
//  Copyright © 2016年 savoryplus.SavoryPlus. All rights reserved.
//

import UIKit
import Social

class NoteDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var labelTemporature: UILabel!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelTag: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var retakeButOut: UIButton!
    var note: [NoteData] = []
    var tagtag: Int = 0
    
    // MARK: Here herererere
    @IBAction func shareBut(sender: AnyObject) {
        let controller = SLComposeViewController(forServiceType:
            SLServiceTypeFacebook)
        controller.addImage(self.imageFood.image)
        controller.setInitialText("This looks delicious!")
        self.presentViewController(controller, animated: true,
                                   completion: nil)
    }
    
    @IBAction func setBut(sender: AnyObject) {
        
    }
    
    @IBAction func retakePhoto(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("info \(info)")
        let image = info["UIImagePickerControllerOriginalImage"]
        self.imageFood.image = image as? UIImage
        
        UIImageWriteToSavedPhotosAlbum(self.imageFood.image!, nil, nil, nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageFood.image = UIImage(named: self.note[tagtag].image)
        self.labelTemporature.text = self.note[tagtag].temperature
        self.labelTimer.text = self.note[tagtag].timer
        self.labelTag.text = self.note[tagtag].tag
        
        retakeButOut.layer.cornerRadius = 5
        retakeButOut.layer.borderWidth = 1
        retakeButOut.layer.borderColor = UIColor.init(red: 245/255, green: 166/255, blue: 35/255, alpha: 1).CGColor
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
