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

        // Do view setup here.
    }
    private let eduacationArray:[String] = ["School: \((FirebaseStorageInteractor.shared.description?.education.school)!)","University: \((FirebaseStorageInteractor.shared.description?.education.highEducation.university)!)", "Faculty: \((FirebaseStorageInteractor.shared.description?.education.highEducation.faculty)!)","Specialty: \((FirebaseStorageInteractor.shared.description?.education.highEducation.specialty)!)", "Other information: \((FirebaseStorageInteractor.shared.description?.education.highEducation.other)!)"]
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 5
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! NSTableCellView
        cell.textField?.stringValue = eduacationArray[row]
        return cell
    }
    
}
