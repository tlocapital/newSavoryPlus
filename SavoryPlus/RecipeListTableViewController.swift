//
//  RecipeListTableViewController.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/4/25.
//  Copyright © 2016年 SavoryPlus. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecipeListTableViewController: UITableViewController {
    
    let cellIdentifier = "RecipeListTableCell"
    // Create a array of fake data from RecipeData.swift
    let createFakeArrayData = RecipeData.createFakeDatas()
    let mainURL = "http://recipe.remindme.rocks/api/v1/recipes.json"
    var thisJSON: JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, mainURL).responseJSON { response in
            self.thisJSON = JSON(response.result.value!)
            print(self.thisJSON.count)
            self.tableView.reloadData()
        }
        
        // Delete lines between UITableViewCells in UITableView
        // http://stackoverflow.com/questions/26653883/delete-lines-between-uitableviewcells-in-uitableview
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.thisJSON.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RecipeListTableViewCell
        
        cell.imageFood.image = UIImage(named: createFakeArrayData[indexPath.row].image)
        cell.labelTitle.text = self.thisJSON[indexPath.row]["title"].stringValue
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RecipeDetailViewController" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destController = segue.destinationViewController as! RecipeDetailViewController
                let initIndexRef = mainURL.rangeOfString("http")?.startIndex
                let endIndexRef = mainURL.rangeOfString("recipes")?.endIndex
                print (initIndexRef)
                print (endIndexRef)
                let catchedURL = mainURL.substringFromIndex(initIndexRef!).substringToIndex(endIndexRef!)
                print (catchedURL)
                

                let nextURL = "\(catchedURL)/\(thisJSON[indexPath.row]["id"]).json"
                print (nextURL)
                
                destController.recipeURL = nextURL
            }
        }
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
