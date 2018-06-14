//
//  VCPerfil.swift
//  ReviewApp
//
//  Created by PABLO GUARDADO ALVAREZ on 14/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCPerfil: UIViewController {

   
    
    
    
    
    @IBOutlet weak var btnEditarFoto: UILabel!
    
    @IBOutlet weak var imgPerfil: UIImageView!
    
    @IBOutlet weak var lbNombre: UILabel!
    
    @IBOutlet weak var lbApellido: UILabel!
    
    @IBOutlet weak var lbValoracionMedia: UILabel!
    
    @IBOutlet weak var lbNumeroValoraciones: UILabel!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtGenero: UITextField!
    
    @IBOutlet weak var btnEditarNombre: UIButton!
    
    var aux:Float? = 0.0
    var aux1:Int = 0
    var aux2:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgPerfil.layer.cornerRadius = imgPerfil.bounds.size.width/5
        txtNombre.text = DataHolder.sharedInstance.myProfile.sNombreUsuario
        txtGenero.text = DataHolder.sharedInstance.myProfile.sGender
        lbNumeroValoraciones.text = String(DataHolder.sharedInstance.myProfile.asReviews.count)
        lbValoracionMedia.text = String(format: "%.01f", (DataHolder.sharedInstance.myProfile.userMedia)!)
        


        for review in DataHolder.sharedInstance.myProfile.asReviews {
            
            let docreference = DataHolder.sharedInstance.fireStoreDB?.collection("reviews").document(review)
            
            docreference?.getDocument { (document, error) in
                if let document = document, document.exists {
                    var auxGuay = document.data()
                    self.aux1 = auxGuay!["score"] as! Int
                    self.aux2 = self.aux2 + self.aux1
                } else {
                    print("Document does not exist")
                }
            }
           
        }
        
        aux = Float(aux2)/Float(DataHolder.sharedInstance.myProfile.asReviews.count)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editarNombre(){
        
        if txtNombre.isEnabled==false{
            
        txtNombre.isEnabled = true
            
        }else{
        
            DataHolder.sharedInstance.myProfile.sNombreUsuario = txtNombre.text
            DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document(DataHolder.sharedInstance.myProfile.userID!).setData(DataHolder.sharedInstance.myProfile.getMap(), merge: true)
            txtNombre.isEnabled = false
            
        }
    }
    
    @IBAction func AccionbtnVolver(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func editarGenero(){
        
        if txtGenero.isEnabled==false{
            
            txtGenero.isEnabled = true
            
        }else{
            DataHolder.sharedInstance.myProfile.sGender = txtGenero.text
            DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document(DataHolder.sharedInstance.myProfile.userID!).setData(DataHolder.sharedInstance.myProfile.getMap(), merge: true)
            txtGenero.isEnabled = false
        }
    }
    
    @IBAction func actualizarMedia(){
        
        
        lbValoracionMedia.text = String(format: "%.01f", (Float(aux2)/Float(DataHolder.sharedInstance.myProfile.asReviews.count)))
        
       DataHolder.sharedInstance.myProfile.userMedia = (Float(aux2)/Float(DataHolder.sharedInstance.myProfile.asReviews.count))
        
        DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document(DataHolder.sharedInstance.myProfile.userID!).setData(DataHolder.sharedInstance.myProfile.getMap(), merge: true)
        
        
    }
    
    



}
