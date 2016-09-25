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
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: UserDefaultsKeys.checklistIndex.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.checklistIndex.rawValue)
//            UserDefaults.standard.synchronize()
        }
    }
    
    init() {
        print("path \( dataFilePath())")
        loadChecklist()
        registerDefaults()
        handleFirstTime()
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0]
    }
    func dataFilePath() -> String {
        //      "\(documentsDirectory())/Checklist10.plist"
        return (documentsDirectory() as NSString).strings(byAppendingPaths: ["\(PersistenceKeys.file.rawValue)\(PersistenceKeys.ext.rawValue)"])[0]
    }
    
    func saveChecklist() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(lists, forKey: PersistenceKeys.root.rawValue)
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
                if let items = unarchiver.decodeObject(forKey: PersistenceKeys.root.rawValue) as? [Checklist] {
                    loadedList = items
                }
                unarchiver.finishDecoding()
        }
        lists = loadedList ?? [Checklist]()
        sortChecklist()
    }
    
    func registerDefaults() {
        let dictionary: [String: Any] = [UserDefaultsKeys.checklistIndex.rawValue: -1, UserDefaultsKeys.firstTime.rawValue: true]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func handleFirstTime() {
        if UserDefaults.standard.bool(forKey: UserDefaultsKeys.firstTime.rawValue) {
            let checklist = Checklist(name: PersistenceKeys.defaultName.rawValue)
            lists?.append(checklist)
            indexOfSelectedChecklist = 0
            UserDefaults.standard.set(false, forKey: UserDefaultsKeys.firstTime.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    func sortChecklist() {
        lists?.sort() { $0.name.localizedStandardCompare($1.name) == .orderedAscending }
    }
}
