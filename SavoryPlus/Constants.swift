//
//  Constants.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/5/2.
//  Copyright © 2016年 savoryplus.SavoryPlus. All rights reserved.
//

import Foundation
import UIKit

//Keys
let KEY_UID = "uid"

//Segues
let SEGUE_FACEBOOK_LOG_IN = "FacebookLogIn"
let SEGUE_EMAIL_LOG_IN = "EmailLogIn"

//Status_Codes
let STATUS_ACCOUNT_NONEXIST = -8

func appendingArray (numbers : Int, unit : String) -> [String] {
    var array = [String]()
    for i in 0...numbers {
        array.append("\(i) \(unit)")
    }
    return array
}

var hoursInpicker = appendingArray(24, unit: "小時")
var minutesInpicker = appendingArray(60, unit: "分鐘")

let thisPickerData = [
    hoursInpicker,
    minutesInpicker
]