//
//  AllListViewController.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/22/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

class AllListViewController: UITableViewController {
    var lists: [Checklist]
    
    required init?(coder aDecoder: NSCoder) {
        lists = [Checklist]()
        super.init(coder: aDecoder)
        loadChecklist()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("path \( dataFilePath())")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        lists.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellForTableView(tableView: tableView)
        
        let checklist = lists[indexPath.row]
        cell.textLabel?.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    func cellForTableView(tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)  else {
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        return cell
    }

    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = lists[indexPath.row]
        
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let navigationController = storyboard?.instantiateViewController(withIdentifier: "ListDetailNavigationController") as? UINavigationController, let controller = navigationController.topViewController as? ListDetailViewController else { return }
        
        controller.delegate = self
        
        let checklist = lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        
        present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "ShowChecklist" {
            let controller = segue.destination as? ChecklistTableViewController
            controller?.checklist = sender as? Checklist
        } else if segue.identifier == "AddChecklist" {
            if let navigationController = segue.destination as? UINavigationController
                ,let controller = navigationController.topViewController as? ListDetailViewController {
                controller.delegate = self
                controller.checklistToEdit = nil
            }
            
        }
    }
    
}

extension AllListViewController: ListDetailViewControllerDelegate {
    func listDetailDidCancel(controller: ListDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    func listDetail(viewController controller: ListDetailViewController, didFinishAddingCheckList checklist: Checklist) {
        let newRowIndex = lists.count
        lists.append(checklist)
        tableView.insertRows(at:[IndexPath(row: newRowIndex, section: 0)] , with: .automatic)
        dismiss(animated: true, completion: nil)
    }
    
    func listDetail(viewController controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist) {
        guard let index = lists.index(of: checklist) else {
            return
        }
        let indexPath = IndexPath(row: index, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.textLabel?.text = checklist.name
        }
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - extensions Documents folder
extension AllListViewController {
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
        let path = dataFilePath()
        if FileManager.default.fileExists(atPath: path) {
            if let data = NSData(contentsOfFile: path) as? Data {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
                if let items = unarchiver.decodeObject(forKey: "Checklists") as? [Checklist] {
                    lists = items
                }
                unarchiver.finishDecoding()
            }
        }
        
    }
    
}
