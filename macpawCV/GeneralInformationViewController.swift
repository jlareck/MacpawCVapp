//
//  FirstViewController.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/27/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa

class GeneralInformationViewController: NSViewController {
 
    @IBOutlet weak var fullName: NSTextField!
    
    @IBOutlet weak var age: NSTextField!
    
    @IBOutlet weak var email: NSTextField!
    
    @IBOutlet weak var phoneNumber: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.stringValue = "Full name: "+(FirebaseStorageInteractor.shared.description?.generalInformation.fullName)!
        age.stringValue = "Age: \(Int32((FirebaseStorageInteractor.shared.description?.generalInformation.age)!))"
        email.stringValue = "Email: " + ((FirebaseStorageInteractor.shared.description?.generalInformation.email)!)
        phoneNumber.stringValue = "Phone number: "+(FirebaseStorageInteractor.shared.description?.generalInformation.mobilePhoneNumber)!
        
    }
}
