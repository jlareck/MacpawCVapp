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
                    //NSApplication.shared.mainWindow?.close()
                    // self.present(vc as NSViewController , animator: PresentAnimator.init(with: .bottom))

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
