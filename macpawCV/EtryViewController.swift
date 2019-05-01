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
        
        let handler:(Description?)->() = { (key: Description?)->() in
            if  key != nil {
                let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "Split") as! SplitViewController
                //NSApplication.shared.mainWindow?.close()
                self.present(vc , animator: PresentAnimator())
            //    self.performSegue(withIdentifier: , sender: <#T##Any?#>)
            }
        }
        FirebaseStorageInteractor.shared.fetch(handler: handler)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
