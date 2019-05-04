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
        skillsTextField.stringValue = "Progrmming languages: \nC++: \((skillsModel?.programmingLanguages["cpp"])!) \nSwift: \((skillsModel?.programmingLanguages["swift"])!)"
        
        otherSkillsTextField.stringValue = "Other Skills: \nGit: \((skillsModel?.others.git)!) \nTechnologies: \((skillsModel?.others.technologies.joined(separator: ", "))!+".") \nAlgorithms: \((skillsModel?.others.algorithms)!)"
      
    }
    
}
