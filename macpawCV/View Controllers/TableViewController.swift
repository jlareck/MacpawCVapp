//
//  TableViewController.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/20/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa

var index: Int = 0
class TableViewController: NSViewController,NSTableViewDataSource, NSTableViewDelegate  {
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewWillAppear() {
        tableView.rowHeight = 50
    }
    
    private let sectionArray = ["General information", "Education", "Skills", "Accomplishments"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return sectionArray.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! NSTableCellView
        cell.textField?.stringValue = sectionArray[row]
        return cell
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        index = tableView.selectedRow
        
        let userInfo = ["info":index]
        
        NotificationCenter.default.post(name: NSNotification.Name("selectionChanged"), object: nil, userInfo: userInfo)
    }
    
}
