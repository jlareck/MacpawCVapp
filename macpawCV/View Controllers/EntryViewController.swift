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
                   
                  
                    ((vc.splitViewItems[1].viewController as! TabViewController).tabViewItems[0].viewController as! GeneralInformationViewController).generalInformationModel = FirebaseStorageInteractor.shared.description?.generalInformation
                    
                    ((vc.splitViewItems[1].viewController as! TabViewController).tabViewItems[1].viewController as! EducationViewController).educationModel = FirebaseStorageInteractor.shared.description?.education
                    
                    ((vc.splitViewItems[1].viewController as! TabViewController).tabViewItems[2].viewController as! SkillsViewController).skillsModel = FirebaseStorageInteractor.shared.description?.skills
                    
                    ((vc.splitViewItems[1].viewController as! TabViewController).tabViewItems[3].viewController as! AccomplishmentsViewController).accomplishmentsModel = FirebaseStorageInteractor.shared.description?.accomplishments
                    
                    vc.view.frame = CGRect(x: 0,y: 0, width: 700, height: 350)
                    self.view.window?.contentViewController = vc
              
                
            case .failure(let error):
                print(error)

            }
        }
        FirebaseStorageInteractor.shared.fetch(handler: handler)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        self.view.frame = CGRect(x: 0,y: 0, width: 400, height: 300)
        //self.view
    }
}
