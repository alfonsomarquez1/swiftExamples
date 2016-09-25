//
//  IconPickerViewController.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/25/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
    func icon(pickerController: IconPickerViewController, didPickIcon iconName: String)
}

class IconPickerViewController: UITableViewController {

    var delegate: IconPickerViewControllerDelegate?
    var icons = Icon.allValues()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        configure(iconCell: cell, withIcon: icons[indexPath.row])
        return cell
    }
    
    private func configure(iconCell: UITableViewCell, withIcon iconName: String) {
        iconCell.textLabel?.text = iconName
        iconCell.imageView?.image = UIImage(named: iconName)
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            delegate?.icon(pickerController: self, didPickIcon: icons[indexPath.row])
        
    }
    
}
