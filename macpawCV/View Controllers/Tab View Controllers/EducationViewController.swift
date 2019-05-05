//
//  Education.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/27/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa

class EducationViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    @IBOutlet weak var educationTableView: NSTableView!
    var educationModel: Education?
    var educationArray: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        educationTableView.rowHeight = 50
      
        educationTableView?.delegate = self
        educationTableView?.dataSource = self
        guard let educationModel = educationModel else {return print("No data")}
        educationArray = ["School: \((educationModel.school))","University: \((educationModel.highEducation.university))", "Faculty: \((educationModel.highEducation.faculty))","Specialty: \((educationModel.highEducation.specialty))", "Other information: \((educationModel.highEducation.other))"]
      
    }

    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 5
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! NSTableCellView
        cell.textField?.lineBreakMode = .byWordWrapping
        cell.textField?.stringValue = educationArray![row]
        return cell
    }
    
}
