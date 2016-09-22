//
//  CheckItem.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/13/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import Foundation

class CheckItem: NSObject, NSCoding {
    var task: String
    var checked: Bool
    
    override init() {
        task = ""
        checked = false
        super.init()
    }
    
    init(_ task: String) {
        self.task = task
        checked = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        task = aDecoder.decodeObject(forKey: "Text") as? String ?? ""
        checked = aDecoder.decodeBool(forKey: "Checked") 
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(task, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    func toggleCheck() {
        checked = !checked
    }
}
