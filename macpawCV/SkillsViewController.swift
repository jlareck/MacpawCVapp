//
//  SkillsViewController.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/27/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa

class SkillsViewController: NSViewController {

    @IBOutlet weak var otherSkillsTextField: NSTextField!
    @IBOutlet weak var skillsTextField: NSTextField!
    private var str:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        transformArrayToString()
        otherSkillsTextField.lineBreakMode = .byWordWrapping
        skillsTextField.lineBreakMode = .byWordWrapping
        skillsTextField.stringValue = "Progrmming languages: \nC++: \((FirebaseStorageInteractor.shared.description?.skills.programmingLanguages.cpp)!) \nSwift: \((FirebaseStorageInteractor.shared.description?.skills.programmingLanguages.swift)!)"
        
        otherSkillsTextField.stringValue = "Other Skills: \nGit: \((FirebaseStorageInteractor.shared.description?.skills.others.git)!) \nTechnologies: \(str) \nAlgorithms: \((FirebaseStorageInteractor.shared.description?.skills.others.algorithms)!)"
        // Do view setup here.
    }
    
    func transformArrayToString(){
        for (index, i) in ((FirebaseStorageInteractor.shared.description?.skills.others.technologies.enumerated())!) {
            str+=i
            if ((FirebaseStorageInteractor.shared.description?.skills.others.technologies.endIndex)!-1) == index {
                str+="."
            }
            else {
                str+=", "
            }
        }
    }
    
}
