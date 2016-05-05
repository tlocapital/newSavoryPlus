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
    
    var note: NoteData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageFood.image = UIImage(named: note.image)
        self.labelTemporature.text = note.temperature
        self.labelTimer.text = note.timer
        self.labelTag.text = note.tag
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
