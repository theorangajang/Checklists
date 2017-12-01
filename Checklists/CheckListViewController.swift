//
//  CheckListViewController.swift
//  Checklists
//
//  Created by Alex Jang on 11/29/17.
//  Copyright © 2017 AlexJang. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    var row0Item: CheckListItem
    var row1Item: CheckListItem
    var row2Item: CheckListItem
    var row3Item: CheckListItem
    var row4Item: CheckListItem
    
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = row0Item.text
        } else if indexPath.row % 5 == 1 {
            label.text = row1Item.text
        } else if indexPath.row % 5 == 2 {
            label.text = row2Item.text
        } else if indexPath.row % 5 == 3 {
            label.text = row3Item.text
        } else if indexPath.row % 5 == 4 {
            label.text = row4Item.text
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            var isChecked = false
            if indexPath.row == 0 {
                row0checked = !row0Item.checked
            } else if indexPath.row == 1 {
                row1checked = !row1Item.checked
            } else if indexPath.row == 2 {
                row2checked = !row2Item.checked
            } else if indexPath.row == 3 {
                row3checked = !row3Item.checked
            } else if indexPath.row == 4 {
                row4checked = !row4Item.checked
            }
            changeCellAccessory(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func changeCellAccessory(for cell: UITableViewCell, at indexPath: IndexPath){
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0Item.checked
        } else if indexPath.row == 1 {
            isChecked = row1Item.checked
        } else if indexPath.row == 2 {
            isChecked = row2Item.checked
        } else if indexPath.row == 3 {
            isChecked = row3Item.checked
        } else if indexPath.row == 4 {
            isChecked = row4Item.checked
        }
    
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    
    }

}
