//
//  ListDetailViewController.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/23/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailDidCancel(controller: ListDetailViewController)
    
    func listDetail(viewController controller: ListDetailViewController, didFinishAddingCheckList checklist: Checklist)
    
    func listDetail(viewController controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist)
}

class ListDetailViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    var checklistToEdit: Checklist?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    
    // MARK: - IBActions
    @IBAction func cancel() {
        delegate?.listDetailDidCancel(controller: self)
    }
    
    @IBAction func done() {
        guard let text = textField.text else { return }
        if let checklist = checklistToEdit {
            checklist.name = text
            delegate?.listDetail(viewController: self, didFinishEditingChecklist: checklist)
        } else {
            let checklist = Checklist(name: text)
            delegate?.listDetail(viewController: self, didFinishAddingCheckList: checklist)
        }
    }
}

extension ListDetailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let oldText = text as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarButton.isEnabled = newText.length > 0
        return true
    }
}
