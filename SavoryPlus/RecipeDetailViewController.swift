//
//  RecipeDetailViewController.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/4/25.
//  Copyright © 2016年 SavoryPlus. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecipeDetailViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var collectionView: UICollectionView!    
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var collectVFLayout: UICollectionViewFlowLayout!
    
    // Create a array of fake data from RecipeData.swift
    private var createFakeArrayData = RecipeData.createFakeDatas()
    private var cellIdentifier = "RecipeDetailCell"
    var recipeURL: String = ""
    var tempRecipeData: JSON = []
    var pagesCount: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, recipeURL).responseJSON { response in
            self.tempRecipeData = JSON(response.result.value!)
            print(self.tempRecipeData.count)
            self.pagesCount = (self.tempRecipeData.count + self.tempRecipeData["steps"].count - 1)
            print(self.pagesCount)
            self.collectionView.reloadData()
        }
        
        let width = (UIScreen.mainScreen().bounds.width - 10)
        self.collectVFLayout.itemSize = CGSize(width: width, height: width)
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

extension RecipeDetailViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pagesCount
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! RecipeDetailCollectionViewCell

            switch indexPath.row {
            case 0:
                cell.labelTitle.text = tempRecipeData["recipe"]["title"].stringValue
                cell.labelDescription.text = tempRecipeData["recipe"]["content"].stringValue
            case 1:
                cell.labelTitle.text = "食材"
                let ingredientsCount = tempRecipeData["ingredients"].count
                let ingredientsAll = printCountedData(ingredientsCount)
                cell.labelDescription.text = ingredientsAll
            default:
//                let stepCount = self.tempRecipeData["steps"].count
                cell.labelTitle.text = "步驟 " + tempRecipeData["steps"][indexPath.row-2]["step_title"].stringValue
                cell.labelDescription.text = tempRecipeData["steps"][indexPath.row-2]["description"].stringValue
            }
        return cell
    }
    
    func printCountedData (count: Int) -> String {
        var str: String = ""
        for i in 0...count-1 {
            str += "\(tempRecipeData["ingredients"][i]["name"].stringValue) : \(tempRecipeData["ingredients"][i]["amount"].stringValue) \n"
        }
        return str
    }
    
}
