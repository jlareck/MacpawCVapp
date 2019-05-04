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
    @IBOutlet weak var imageView: NSImageView!
    
    @IBOutlet weak var phoneNumber: NSTextField!
    var generalInformationModel: GeneralInformation?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let generalInformationModel = generalInformationModel else {return print("No data")}
        fullName.stringValue = "Full name: "+(generalInformationModel.fullName)
        age.stringValue = "Age: \(Int32((generalInformationModel.age)))"
        email.stringValue = "Email: " + ((generalInformationModel.email))
        phoneNumber.stringValue = "Phone number: "+(generalInformationModel.mobilePhoneNumber)
        
        FirebaseStorageInteractor.shared.getImage(url: generalInformationModel.imageURL) { (result) in
            switch result {
            case .success(let value):
                self.imageView.image = value
            case .failure(_):
                print("fail")
                
            }
        }
    }
}
