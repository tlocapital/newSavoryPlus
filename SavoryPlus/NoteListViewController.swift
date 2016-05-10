//
//  NoteListViewController.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/5/3.
//  Copyright © 2016年 savoryplus.SavoryPlus. All rights reserved.
//

import UIKit

class NoteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var thisTableView: UITableView!
    var notes: [NoteData] = [
        NoteData(title: "五分熟沙朗牛排", image: "beefsteak", tag: "牛肉 沙朗", temperature: "58.5", timer: "80"),
        NoteData(title: "嫩煎羊小排", image: "lambcutlets", tag: "羊肉", temperature: "52.5", timer: "100"),
        NoteData(title: "水波蛋佐燻鮭魚", image: "salmon", tag: "蛋 鮭魚", temperature: "48.5", timer: "30"),
        NoteData(title: "五分熟沙朗牛排", image: "beefsteak", tag: "牛肉 沙朗", temperature: "54", timer: "110")
    ]
    var indexPatha: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "我的筆記"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // http://stackoverflow.com/questions/25994219/ios-8-uinavigationcontroller-hide-back-button
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteListCell", forIndexPath: indexPath) as! NoteListTableViewCell
        
        cell.imageFood.image = UIImage(named: notes[indexPath.row].image)
        cell.labelTitle.text = notes[indexPath.row].title
        cell.labelTag.text = notes[indexPath.row].tag
        cell.labelTemporature.text = notes[indexPath.row].temperature
        cell.labelTimer.text = notes[indexPath.row].timer
        self.indexPatha = indexPath.row
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NoteDetailViewController" {
            //            let destinationController = segue.destinationViewController as! NoteDetailViewController
            //            destinationController.note = notes
            //            destinationController.tagtag = indexPatha
            //        }
            
            if let indexPath = thisTableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! NoteDetailViewController
                destinationController.note = notes
                destinationController.tagtag = indexPath.row
                
            }
        }
    }
    
}
