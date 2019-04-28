//
//  DescriptionViewController.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/20/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa
protocol SendManager {
    func sendString(str:String)
}
class DescriptionViewController: NSViewController  {

    @IBOutlet weak var descriptionField: NSTextField!
  //  var str:String = ""
    //let tableVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "table") as! TableViewController
   // let tableVC = TableViewController()
    var string: String = "fdsa"
//    func sendString(str: String) {
//        descriptionField.stringValue = str
//      //  string = str
//
//    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
       // self.tableVC.delegate? = self
        //updateView()
    
       
  
    }
//    @objc private func viewWasLoaded(_ notification: Notification) {
//        descriptionField.stringValue =  notification.userInfo?["info"] as? String ?? "No info"
//    }
    
}
