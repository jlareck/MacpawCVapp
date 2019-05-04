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
    override func viewWillAppear() {
        accomplishmentsTableView.rowHeight = 70
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        accomplishmentsTableView?.delegate = self
        accomplishmentsTableView?.dataSource = self
        
        // Do view setup here.
    }

    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        return (FirebaseStorageInteractor.shared.description?.accomplishments.count ?? 3)
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! NSTableCellView
        cell.textField?.lineBreakMode = .byWordWrapping
      
        cell.textField?.stringValue = (accomplishmentsModel?[row])!
        return cell
    }
}
