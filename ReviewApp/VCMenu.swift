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
    
    @IBOutlet var vistaMenu:UIView?
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnVolver: UIButton!
    @IBOutlet weak var btnConfig: UIButton!
    @IBOutlet weak var btnAyuda: UIButton!
    @IBOutlet weak var btnSubirRev: UIButton!
    
    var frmMenuaparecer:CGRect?
    var frmMenuDesaparecer:CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        frmMenuDesaparecer = vistaMenu?.frame
        frmMenuaparecer = vistaMenu?.frame
        frmMenuaparecer?.origin.x = 0
        vistaMenu?.isHidden = false
        //btn volver
        btnVolver.titleLabel?.font = UIFont.fontAwesome(ofSize: 15)
        btnVolver.setTitle(String.fontAwesomeIcon(name: .angleLeft), for: .normal)
        //btn subirPerfil
        btnSubirRev.titleLabel?.font = UIFont.fontAwesome(ofSize: 15)
        btnSubirRev.setTitle(String.fontAwesomeIcon(name: .upload) + "   Subir review", for: .normal)
        
        
        //btn Configuracion
        btnConfig.titleLabel?.font = UIFont.fontAwesome(ofSize: 15)
        btnConfig.setTitle(String.fontAwesomeIcon(name: .gear) + "   Configuración",
                           for: .normal)
        //btn menu
        btnMenu.titleLabel?.font = UIFont.fontAwesome(ofSize: 15)
        btnMenu.setTitle(String.fontAwesomeIcon(name: .bars),
                           for: .normal)
        //btn ayuda
        btnAyuda.titleLabel?.font = UIFont.fontAwesome(ofSize: 15)
        btnAyuda.setTitle(String.fontAwesomeIcon(name: .info) + "   Ayuda",
                         for: .normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBotonMenu(){
        print("-----------------> Funciona el boton")
        UIView.animate(withDuration: 0.5, delay: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            
            self.vistaMenu?.frame = self.frmMenuaparecer!
            
            
        }, completion: {(finished)-> Void in
            print("acabe anim")
        })
        
    }
    
    @IBAction func accionBotonCerrar(){
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            
            self.vistaMenu?.frame = self.frmMenuDesaparecer!
            
            
        }, completion: {(finished)-> Void in
            
        })
        
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
