//
//  Education.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/27/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa

class EducationViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    @IBOutlet weak var EducationTableView: NSTableView!
    override func viewWillAppear() {
        EducationTableView.rowHeight = 50
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        EducationTableView?.delegate = self
        EducationTableView?.dataSource = self
        educationArray = ["School: \((educationModel?.school)!)","University: \((educationModel?.highEducation.university)!)", "Faculty: \((educationModel?.highEducation.faculty)!)","Specialty: \((educationModel?.highEducation.specialty)!)", "Other information: \((educationModel?.highEducation.other)!)"]
        // Do view setup here.
    }
    var educationModel: Education?
    var educationArray: [String]?
    
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
