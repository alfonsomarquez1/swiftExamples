//
//  ItemDetailViewController.swift
//  Checklist10
//
//  Created by Luis Alfonso Marquez Lecona on 9/13/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailDidCancel(controller: ItemDetailViewController)
    func itemDetail(controller: ItemDetailViewController, didFinishAddingItem item: CheckItem)
    func itemDetail(controller: ItemDetailViewController, didFinishEditingItem: CheckItem)
}

class ItemDetailViewController: UITableViewController {
    // MARK: - Class Properties
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: CheckItem?
    
    // MARK: IBOutlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.task
            doneBarButton.isEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK: - IBActions
    @IBAction func cancel() {
        delegate?.itemDetailDidCancel(controller: self)
    }
    
    @IBAction func done() {
        guard let text = textField.text else { return }
        if let item = itemToEdit {
            item.task = text
            delegate?.itemDetail(controller: self, didFinishEditingItem: item)
        } else {
            let item = CheckItem(text)
            delegate?.itemDetail(controller: self, didFinishAddingItem: item)
        }
    }
    
}

// MARK: - extension UITextFieldDelegate
extension ItemDetailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let oldText = text as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        doneBarButton.isEnabled = newText.length > 0
        return true
    }
}
