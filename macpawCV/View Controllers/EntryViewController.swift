//
//  EtryViewController.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/28/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa

class EntryViewController: NSViewController {
   
    
    @IBAction func showCV(_ sender: Any) {
        
        let handler:(Result<Description,Error>)->() = { (key: Result)->() in
            switch key {
            case .success(_):
               
                    let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "Split") as! SplitViewController
                   
                  let tabVC = vc.splitViewItems[1].viewController as! TabViewController
                    (tabVC.tabViewItems[0].viewController as! GeneralInformationViewController).generalInformationModel = NetworkManager.shared.description?.generalInformation
                    
                    (tabVC.tabViewItems[1].viewController as! EducationViewController).educationModel = NetworkManager.shared.description?.education
                    
                    (tabVC.tabViewItems[2].viewController as! SkillsViewController).skillsModel = NetworkManager.shared.description?.skills
                    
                    (tabVC.tabViewItems[3].viewController as! AccomplishmentsViewController).accomplishmentsModel = NetworkManager.shared.description?.accomplishments
                    
                    vc.view.frame = CGRect(x: 0,y: 0, width: 700, height: 420)
                    self.view.window?.contentViewController = vc
              
            case .failure(let error):
                print(error)

            }
        }
        NetworkManager.shared.fetch(handler: handler)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
