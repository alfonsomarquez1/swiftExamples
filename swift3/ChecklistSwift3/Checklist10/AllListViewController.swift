//
//  AllListViewController.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/22/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

class AllListViewController: UITableViewController {
    var dataModel: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.delegate = self
        if let index = dataModel?.indexOfSelectedChecklist, let dataCount = dataModel?.lists?.count, index >= 0  && index < dataCount {
            let checklist = dataModel?.lists?[index]
            performSegue(withIdentifier: "ShowChecklist", sender: checklist)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel?.lists?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        dataModel?.lists?.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellForTableView(tableView: tableView)
        configure(cell: cell, withChecklist: dataModel?.lists?[indexPath.row])
        return cell
    }
    
    private func configure(cell:UITableViewCell, withChecklist checklist: Checklist?) {
        guard let checklist = checklist else { return }
        
        cell.textLabel?.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        cell.detailTextLabel?.text = getDetailMessageBy(items: (checklist.countUncheckedItems(), checklist.items.count))
        cell.imageView?.image = UIImage(named: checklist.iconName)
    }
    
    private func getDetailMessageBy(items: (uncheckedItems: Int, totalItems: Int)) -> String{
        switch items {
        case (0,0):
            return "(No Items)"
        case (0, _):
            return "All Done!"
        //case (let unchecked, let total) where unchecked == total:
        //    return "(All Items Pending)"
        default:
            return "\(items.uncheckedItems) Remaining"
        }
    }
    
    func cellForTableView(tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)  else {
            return UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        return cell
    }

    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModel?.indexOfSelectedChecklist =  indexPath.row
        
        let checklist = dataModel?.lists?[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let navigationController = storyboard?.instantiateViewController(withIdentifier: "ListDetailNavigationController") as? UINavigationController, let controller = navigationController.topViewController as? ListDetailViewController else { return }
        
        controller.delegate = self
        
        let checklist = dataModel?.lists?[indexPath.row]
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
        //guard let newRowIndex = dataModel?.lists?.count else { return }
        //tableView.insertRows(at:[IndexPath(row: newRowIndex, section: 0)] , with: .automatic)
        dataModel?.lists?.append(checklist)
        dataModel?.sortChecklist()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func listDetail(viewController controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist) {
        /*guard let index = dataModel?.lists?.index(of: checklist) else {
            return
        }
        let indexPath = IndexPath(row: index, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.textLabel?.text = checklist.name
        }*/
        dataModel?.sortChecklist()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

extension AllListViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController === self {
            dataModel?.indexOfSelectedChecklist = -1
        }
    }
}

