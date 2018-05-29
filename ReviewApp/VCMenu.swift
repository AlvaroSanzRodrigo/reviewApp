//
//  VCMenu.swift
//  ReviewApp
//
//  Created by PABLO GUARDADO ALVAREZ on 25/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCMenu: UIViewController {
    
    @IBOutlet var vistaMenu:UIView?
    
    var frmMenuaparecer:CGRect?
    var frmMenuDesaparecer:CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()

        frmMenuDesaparecer = vistaMenu?.frame
        frmMenuaparecer = vistaMenu?.frame
        frmMenuaparecer?.origin.x = 0
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBotonMenu(){
        UIView.animate(withDuration: 2, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            
            self.vistaMenu?.frame = self.frmMenuaparecer!
            
            
        }, completion: {(finished)-> Void in
            
        })
        
    }
    
    @IBAction func accionBotonCerrar(){
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
