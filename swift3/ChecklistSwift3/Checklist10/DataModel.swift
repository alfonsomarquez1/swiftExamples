//
//  DataModel.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/24/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import Foundation

class DataModel {
    var lists: [Checklist]?
    
    init() {
        print("path \( dataFilePath())")
        loadChecklist()
    }
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0]
    }
    func dataFilePath() -> String {
        //      "\(documentsDirectory())/Checklist10.plist"
        return (documentsDirectory() as NSString).strings(byAppendingPaths: ["Checklist.plist"])[0]
    }
    
    func saveChecklist() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(lists, forKey: "Checklists")
        archiver.finishEncoding()
        do {
            try data.write(toFile: dataFilePath(), options: .atomic)
        } catch {
            print("couldn't write tasks")
        }
    }
    
    func loadChecklist() {
        var loadedList: [Checklist]? = nil
        let path = dataFilePath()
        if FileManager.default.fileExists(atPath: path), let data = NSData(contentsOfFile: path) as? Data {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
                if let items = unarchiver.decodeObject(forKey: "Checklists") as? [Checklist] {
                    loadedList = items
                }
                unarchiver.finishDecoding()
        }
        lists = loadedList ?? [Checklist]()
    }
}
