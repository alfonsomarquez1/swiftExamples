//
//  Icon.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/25/16.
//  Copyright © 2016 Softclick. All rights reserved.
//


public enum Icon : String {
    case noIcon = "No Icon", appointments = "Appointments", birthdays = "Birthdays", chores = "Chores", drinks = "Drinks", folder = "Folder", groceries = "Groceries", inbox = "Inbox", photos = "Photos", trips = "Trips"
    
    private func getValue() -> String {
        return self.rawValue
    }
    
    static let allIcons = [noIcon, appointments, birthdays, chores, drinks, folder, groceries, inbox, photos, trips]
    
    static func allValues() -> [String] {
        return allIcons.map { return $0.getValue() }

    }
    
}
