//
//  AccomplishmentsViewController.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 5/3/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa

class AccomplishmentsViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource  {

    @IBOutlet weak var accomplishmentsTableView: NSTableView!
    var accomplishmentsModel: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        accomplishmentsTableView?.delegate = self
        accomplishmentsTableView?.dataSource = self
        accomplishmentsTableView.rowHeight = 120

    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        return (NetworkManager.shared.description?.accomplishments.count ?? 3)
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! NSTableCellView
        cell.textField?.lineBreakMode = .byWordWrapping
      
        cell.textField?.stringValue = (accomplishmentsModel?[row])!
        return cell
    }
}
