//
//  CheckItem.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/13/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import Foundation

class CheckItem {
    var task: String
    var checked: Bool
    
    init(_ task: String) {
        self.task = task
        checked = false
    }
    
    func toggleCheck() {
        checked = !checked
    }
}
