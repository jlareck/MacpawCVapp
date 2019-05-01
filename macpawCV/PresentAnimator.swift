//
//  PresentAnimator.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 5/1/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
import Cocoa
class ReplaceSegue: NSStoryboardSegue {
    override func perform() {
        if let fromViewController = sourceController as? NSViewController {
            if let toViewController = destinationController as? NSViewController {
                // no animation.
                fromViewController.view.window?.contentViewController = toViewController
            }
        }
    }
    
}
class PresentAnimator: NSObject, NSViewControllerPresentationAnimator {
    
    enum Direction {
        case left
        case right
        case top
        case bottom
    }
    
    public var fromFrame: NSRect!
    
    public var toFrame: NSRect!
    
    public var direction: Direction = .bottom
    
    init(with direction: Direction = .bottom, fromFrame: NSRect? = nil,toFrame: NSRect? = nil) {
        super.init()
        self.fromFrame = fromFrame
        self.toFrame = toFrame
        self.direction = direction
    }
    
    public func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        if fromFrame == nil {
            let frame = fromViewController.view.bounds
            var dx: CGFloat = 0
            var dy: CGFloat = 0
            switch direction {
            case .bottom:
                dx = 0
                dy = -frame.height
                break
            case .top:
                dx = 0
                dy = frame.height
                break
            case .right:
                dx = frame.width
                dy = 0
                break
            case .left:
                dx = -frame.width
                dy = 0
                break
            }
            fromFrame = frame.offsetBy(dx: dx, dy: dy)
        }
        
        if toFrame == nil {
            toFrame = fromViewController.view.bounds
        }
        
        fromViewController.addChild(viewController)
        
        viewController.view.frame = fromFrame
        fromViewController.view.addSubview(viewController.view)
        
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.4
            viewController.view.animator().frame = toFrame
            fromViewController.view.window?.contentViewController = viewController
            viewController.view.animator().alphaValue = 1.0
            
        }, completionHandler: nil)
        
        // 需要重新计算 view loop
        fromViewController.view.window?.recalculateKeyViewLoop()
    }
    
    public func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.4
            viewController.view.animator().frame = fromFrame
        }) {
            viewController.view.removeFromSuperview()
            viewController.removeFromParent()
        }
    }
    
}
