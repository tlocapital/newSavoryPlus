//
//  RecipeDetailCollectionViewCell.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/4/25.
//  Copyright © 2016年 SavoryPlus. All rights reserved.
//

import UIKit
import Alamofire

class RecipeDetailCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    
    var recipeData: RecipeData! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        self.labelTitle.text = recipeData.title
        self.labelDescription.text = recipeData.description
    }
    
}
