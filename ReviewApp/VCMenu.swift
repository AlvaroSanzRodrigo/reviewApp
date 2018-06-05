//
//  VCMenu.swift
//  ReviewApp
//
//  Created by PABLO GUARDADO ALVAREZ on 25/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FontAwesome_swift

class VCMenu: UIViewController {
    
    @IBOutlet weak var SideView: UIView?
    
    @IBOutlet weak var BlurView: UIVisualEffectView?
   
    @IBOutlet weak var ViewConstrait: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BlurView?.layer.cornerRadius = 5
        SideView?.layer.shadowColor = UIColor.black.cgColor
        SideView?.layer.shadowOpacity = 0.8
        SideView?.layer.shadowOffset = CGSize (width: 5, height: 0 )
        ViewConstrait.constant = -151
        
        
    }
    

    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {

        
        if sender.state == .began || sender.state == .changed {
            
            let translation = sender.translation(in: self.view).x
            
            print(translation)
            
            if ViewConstrait.constant < 25 {
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.ViewConstrait.constant += translation / 2
                    self.view.layoutIfNeeded()
                })
                
                
            }else{
                
                if ViewConstrait.constant > -151 {
                    UIView.animate(withDuration: 0.3, animations: {
                        
                        self.ViewConstrait.constant += translation / 2
                        self.view.layoutIfNeeded()
                    })
                
                
            }
            }
            
        } else if sender.state == .ended{
            
            if ViewConstrait.constant < -151 {
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.ViewConstrait.constant = -151
                    self.view.layoutIfNeeded()
                })
                
            }else{
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.ViewConstrait.constant = 0
                    self.view.layoutIfNeeded()
                })
                
                
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
