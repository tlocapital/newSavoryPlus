//
//  NoteData.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/5/4.
//  Copyright © 2016年 savoryplus.SavoryPlus. All rights reserved.
//

import Foundation

class NoteData {
    
    var title = ""
    var image = ""
    var tag = ""
    var temperature = ""
    var timer = ""
    
    init(title: String, image: String, tag: String, temperature: String, timer: String) {
        self.title = title
        self.image = image
        self.tag = tag
        self.temperature = temperature
        self.timer = timer
    }
    
}