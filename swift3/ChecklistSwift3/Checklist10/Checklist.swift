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
    var iconName: String
    
    convenience init(name: String) {
        self.init(name: name, iconName: Icon.noIcon.rawValue)
    }
    
    init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
        items = [CheckItem]()
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: ChecklistKeys.name.rawValue) as? String ?? ""
        items = aDecoder.decodeObject(forKey: ChecklistKeys.items.rawValue) as? [CheckItem] ?? [CheckItem]()
        iconName = aDecoder.decodeObject(forKey: ChecklistKeys.iconName.rawValue) as? String ?? Icon.noIcon.rawValue
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: ChecklistKeys.name.rawValue)
        aCoder.encode(items, forKey: ChecklistKeys.items.rawValue)
        aCoder.encode(iconName, forKey: ChecklistKeys.iconName.rawValue)
    }
    
    func countUncheckedItems() -> Int {
        return items.reduce(0) { return $0 + ($1.checked ? 0 : 1) }
    }
}
