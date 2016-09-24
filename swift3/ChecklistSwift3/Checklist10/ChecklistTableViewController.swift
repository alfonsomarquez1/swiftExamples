//
//  ChecklistTableViewController.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/9/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

class ChecklistTableViewController: UITableViewController {
    // MARK: -  Class Properties
    var checklist: Checklist?
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        title = checklist?.name ?? "Checklist"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return checklist?.items.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckItem", for: indexPath)
        
        if let checkItem = checklist?.items[indexPath.row] {
            configureCell(cell, withCheckItem: checkItem)
        }
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, withCheckItem item:CheckItem) {
        updateLabel(withCell: cell, andCheckItem: item)
        updateCheck(withCell: cell, andCheckItem: item)
    }
    
    func updateLabel(withCell cell: UITableViewCell, andCheckItem item: CheckItem) {
        guard let label = cell.viewWithTag(1000) as? UILabel else { return }
        label.text = item.task
    }
    
    func updateCheck(withCell cell: UITableViewCell, andCheckItem item: CheckItem) {
        guard let check = cell.viewWithTag(1001) as? UILabel else { return }
        check.text = item.checked ? "√" : " "
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath), let item = checklist?.items[indexPath.row] else { return }

        item.toggleCheck()
        updateCheck( withCell: cell , andCheckItem: item)
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            checklist?.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItem" {
            if let navigationController = segue.destination as? UINavigationController , let controller = navigationController.topViewController as? ItemDetailViewController {
                controller.delegate = self
            }
        } else if segue.identifier == "EditItem" {
            if let navigationController = segue.destination as? UINavigationController, let controller = navigationController.topViewController as? ItemDetailViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                controller.itemToEdit = checklist?.items[indexPath.row]
                controller.delegate = self
            }
        }
    }
    
}

// MARK: - extensions AddItemTableViewControllerDelegate
extension ChecklistTableViewController: ItemDetailViewControllerDelegate {
    func itemDetailDidCancel(controller: ItemDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetail(controller: ItemDetailViewController, didFinishAddingItem item: CheckItem) {
        guard let newRowCount = checklist?.items.count else { return }
        checklist?.items.append(item)
        tableView.insertRows(at: [IndexPath(row: newRowCount, section: 0)], with: .automatic)
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetail(controller: ItemDetailViewController, didFinishEditingItem item: CheckItem) {
        
        if let index = checklist?.items.index(where: { $0.task == item.task}) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
                configureCell(cell, withCheckItem: item)
            }
        }
        dismiss(animated: true, completion: nil)
    }
}

/* MARK: - extensions Documents folder
extension ChecklistTableViewController {
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0]
    }
    func dataFilePath() -> String {
//      "\(documentsDirectory())/Checklist10.plist"
        return (documentsDirectory() as NSString).strings(byAppendingPaths: ["Checklist10.plist"])[0]
    }
    
    func saveChecklistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(checklist?.items, forKey: "ChecklistItems")
        archiver.finishEncoding()
        do {
         try data.write(toFile: dataFilePath(), options: .atomic)
        } catch {
            print("couldn't write tasks")
        }
    }
    
    func loadChecklistItems() {
        let path = dataFilePath()
        if FileManager.default.fileExists(atPath: path) {
            if let data = NSData(contentsOfFile: path) as? Data {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
                if let items = unarchiver.decodeObject(forKey: "ChecklistItems") as? [CheckItem] {
                    checklist?.items = items
                }
                unarchiver.finishDecoding()
            }
        }
        
    }

}*/

