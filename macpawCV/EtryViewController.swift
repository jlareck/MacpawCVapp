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
               // self.present(vc as NSViewController , animator: PresentAnimator.init(with: .bottom))
                vc.view.frame = CGRect(x: 0,y: 0, width: 650, height: 350)
                self.view.window?.contentViewController = vc
//                if let firstController = self.storyboard?.instantiateController(withIdentifier: "First") as? NSViewController {
//                    firstController.view.autoresizingMask = [.width, .height]
//                    firstController.view.frame = self.view.bounds
//                    self.addChild(firstController)
//                    self.view.addSubview(firstController.view)
//                }
//                if let vc = self.storyboard?.instantiateController(withIdentifier: "Split") as? NSViewController {
//                    self.addChild(vc)
//                }
//
//                self.transition(from: self.children.first!, to: self.children.last!, options: .crossfade, completionHandler: nil)
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
        //self.view
    }
}
