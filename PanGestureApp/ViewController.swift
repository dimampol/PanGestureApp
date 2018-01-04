//
//  ViewController.swift
//  PanGestureApp
//
//  Created by apple on 2017-10-12.
//  Copyright © 2017 Dmitrii Poliakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appleImage: UIImageView!
    @IBOutlet weak var bananaImage: UIImageView!
    
//    var appleOrigin: CGPoint!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        addPanGesture(view: appleImage)
//        appleOrigin = appleImage.frame.origin
//    }
//
//    func addPanGesture(view: UIView){
//
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
//        view.addGestureRecognizer(pan)
//    }
//
//    @objc func handlePan(sender: UIPanGestureRecognizer){
//
//        let appleView = sender.view!
//        let translation = sender.translation(in: view)
//
//        switch sender.state {
//        case .began, .changed:
//            appleView.center = CGPoint(x: appleView.center.x + translation.x, y: appleView.center.y + translation.y)
//            sender.setTranslation(CGPoint.zero, in: view)
//        case .ended:
//            if appleView.frame.intersects(bananaImage.frame){
//                UIView.animate(withDuration: 0.3, animations: {
//                    appleView.alpha = 0.0
//                })
//            }
//            else{
//                UIView.animate(withDuration: 0.3, animations: {
//                    appleView.frame.origin = self.appleOrigin
//                })
//            }
//        default:
//            break
//        }
//    }
    
    var appleOrigin: CGPoint!
    
    override func viewDidLoad() {
        
        appleOrigin = appleImage.frame.origin
        addPanGesture(view: appleImage)
    }
    
    func addPanGesture(view: UIView){
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer){
        
        let appleView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            appleView.center = CGPoint(x: appleView.center.x + translation.x, y: appleView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if appleView.frame.intersects(bananaImage.frame){
                UIView.animate(withDuration: 0.3, animations: {
                    appleView.alpha = 0
                })
            }
            else{
                UIView.animate(withDuration: 0.3, animations: {
                    appleView.frame.origin = self.appleOrigin
                })
            }
        default:
            break
        }
    }
}

