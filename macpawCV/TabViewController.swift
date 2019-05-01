//
//  TabViewController.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/28/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa
enum TabViewItem: Int {
    case generalInformation
    case eduacation
    case skills
}
class TabViewController: NSTabViewController {
    
    @IBOutlet weak var tabViewItem: NSTabView!
    
  
    var value: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(viewWasLoaded), name: NSNotification.Name("viewLoaded"), object: nil)
    }
    
    let tableVC = TableViewController()
    
    @objc private func viewWasLoaded(_ notification: Notification) {
        value =  notification.userInfo?["info"] as? Int ?? 0
        tabViewItem.selectTabViewItem(at: value ?? 0)
    }

}

