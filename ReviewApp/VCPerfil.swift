//
//  VCPerfil.swift
//  ReviewApp
//
//  Created by PABLO GUARDADO ALVAREZ on 14/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCPerfil: UIViewController {

   
    
    
    
    @IBOutlet weak var btnVolver: UILabel!
    
    @IBOutlet weak var btnEditarFoto: UILabel!
    
    @IBOutlet weak var imgPerfil: UIImageView!
    
    @IBOutlet weak var lbNombre: UILabel!
    
    @IBOutlet weak var lbApellido: UILabel!
    
    @IBOutlet weak var lbValoracionMedia: UILabel!
    
    @IBOutlet weak var lbNumeroValoraciones: UILabel!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtGenero: UITextField!
    
    @IBOutlet weak var btnEditarNombre: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtNombre.text = DataHolder.sharedInstance.myProfile.sNombreUsuario
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editarNombre(){
        
        if txtNombre.isEnabled==false{
            
        txtNombre.isEnabled = true
            
        }else{
            
            txtNombre.isEnabled = false
        }
    }
    
    @IBAction func editarGenero(){
        
        if txtGenero.isEnabled==false{
            
            txtGenero.isEnabled = true
            
        }else{
            
            txtGenero.isEnabled = false
        }
    }
    
    



}
