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
    var skillsModel: Skills?
    override func viewDidLoad() {
        super.viewDidLoad()
   
        otherSkillsTextField.lineBreakMode = .byWordWrapping
        skillsTextField.lineBreakMode = .byWordWrapping
        guard let skillsModel = skillsModel else{return print("No data") }

        let str = skillsModel.programmingLanguages
            .sorted(by: { (first, second) -> Bool in
            return first.key < second.key
        })
            .reduce("Programming languages: \n"){$0 + $1.key + ": " + $1.value + "\n"}
        
        skillsTextField.stringValue = str
        
        otherSkillsTextField.stringValue = "Other Skills: \nGit: \((skillsModel.others.git)) \nTechnologies: \((skillsModel.others.technologies.joined(separator: ", "))+".") \nAlgorithms: \((skillsModel.others.algorithms))"
      
    }
    
}
