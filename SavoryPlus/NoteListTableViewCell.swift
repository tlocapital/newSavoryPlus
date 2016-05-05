//
//  NoteListTableViewCell.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/5/4.
//  Copyright © 2016年 savoryplus.SavoryPlus. All rights reserved.
//

import UIKit

class NoteListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTag: UILabel!
    @IBOutlet weak var labelTemporature: UILabel!
    @IBOutlet weak var labelTimer: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
