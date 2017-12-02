//
//  CheckListViewController.swift
//  Checklists
//
//  Created by Alex Jang on 11/29/17.
//  Copyright © 2017 AlexJang. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    var itemsList: [CheckListItem]
    
    var row0Item: CheckListItem
    var row1Item: CheckListItem
    var row2Item: CheckListItem
    var row3Item: CheckListItem
    var row4Item: CheckListItem
    
    required init?(coder aDecoder: NSCoder) {
        
        itemsList = [CheckListItem]()
        
        row0Item = CheckListItem()
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        itemsList.append(row0Item)
        
        row1Item = CheckListItem()
        row1Item.text = "Brush my teeth"
        row1Item.checked = true
        itemsList.append(row1Item)
        
        row2Item = CheckListItem()
        row2Item.text = "Learn iOS Development"
        row2Item.checked = true
        itemsList.append(row2Item)
        
        row3Item = CheckListItem()
        row3Item.text = "Soccer Practice"
        row3Item.checked = false
        itemsList.append(row3Item)
        
        row4Item = CheckListItem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = true
        itemsList.append(row4Item)
        
        super.init(coder: aDecoder)
    }
    
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
        return itemsList.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = itemsList[indexPath.row]
        
        changeCellText(for: cell, for: item)
        changeCellAccessory(for: cell, for: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = itemsList[indexPath.row]
            item.changeAccessory()
            changeCellAccessory(for: cell, for: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func changeCellText(for cell: UITableViewCell, for item: CheckListItem){
        let label = cell.viewWithTag(1) as! UILabel
        label.text = item.text
    }
    
    func changeCellAccessory(for cell: UITableViewCell, for item: CheckListItem){
        //here is where you're setting whichever cell you're at to either a checked or nonchecked accessory type
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    
    }

}
