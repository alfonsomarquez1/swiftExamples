//
//  Checklist.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/22/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name: String
    var items: [CheckItem]
    
    init(name: String) {
        self.name = name
        items = [CheckItem]()
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as? String ?? ""
        items = aDecoder.decodeObject(forKey: "Items") as? [CheckItem] ?? [CheckItem]()
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
    }
}
