//
//  DataService.swift
//  SavoryPlus
//
//  Created by 陳正昇 on 2016/5/3.
//  Copyright © 2016年 savoryplus.SavoryPlus. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    static let dataService = DataService()
    private var _REF_BASE = Firebase(url: "https://savoryplus.firebaseio.com")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
}