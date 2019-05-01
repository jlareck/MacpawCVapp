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
 //   var delegate: SendManager?
   // let descVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "Desc") as! DescriptionViewController
    
  
    private let array = ["General information", "Education", "Skills"]
 //   var descArray = ["No experience", "No work", "KNU"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do view setup here.
       // self.delegate = descVC
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return array.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! NSTableCellView
        cell.textField?.stringValue = array[row]
        return cell
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        index = tableView.selectedRow
      //  print(descArray[index])
     //
    let userInfo = ["info":index]
        
       // delegate?.sendString(str: descArray[index])
   
    NotificationCenter.default.post(name: NSNotification.Name("viewLoaded"), object: nil, userInfo: userInfo)
    }

}
