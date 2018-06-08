//
//  VCupladReview.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 5/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase

class VCupladReview: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Outlets de inputs de texto
    @IBOutlet weak var txtProducto: UITextField!
    @IBOutlet weak var txtMarca: UITextField!
    @IBOutlet weak var txtAreaDescripcion: UITextView!
    @IBOutlet weak var txtPros: UITextField?
    @IBOutlet weak var btnPros: UIButton!
    @IBOutlet weak var txtContras: UITextField?
    @IBOutlet weak var btnContras: UIButton!
    @IBOutlet weak var txtLinkCompra: UITextField?
    @IBOutlet weak var btnCamara: UIButton!
    @IBOutlet weak var btnGaleria: UIButton!
    @IBOutlet weak var sldScore: UISlider!
    @IBOutlet weak var borrarPro: UIButton!
    @IBOutlet weak var borrarCon: UIButton!
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var prosvisualizer: UITextView!
    @IBOutlet weak var consvisualizer: UITextView!
    
    var pros:[String] = []
    
    var cons:[String] = []
    
    var reviewToUpload:Review = Review()
    
    
    @IBAction func btnProsAccion(_ sender: Any) {
        
        if (txtPros?.hasText)! {
            prosvisualizer.text.append("\n- " + (txtPros?.text!)!)
            pros.append((txtPros?.text!)!)
            txtPros?.text = nil
            print(pros)
        }
    }
    @IBAction func borrarProsAccion(_ sender: Any) {
        if !pros.isEmpty {
            pros.popLast()
            prosvisualizer.text.removeAll()
            for pro in pros{
                prosvisualizer.text.append("\n- " + pro)
            }
        }
    }
    @IBAction func btnConsAccion(_ sender: Any) {
        if (txtContras?.hasText)! {
            consvisualizer.text.append("\n- " + (txtContras?.text!)!)
            cons.append((txtContras?.text!)!)
            txtContras?.text = nil
            print(cons)
        }
    }
    @IBAction func borrarConAccion(_ sender: Any) {
        if !cons.isEmpty {
            cons.popLast()
            consvisualizer.text.removeAll()
            for con in cons{
                consvisualizer.text.append("\n- " + con)
            }
        }
    }
    
    
    @IBAction func sldShowScore(_ sender: Any) {
        lblScore.text = String(Int.init(sldScore.value))
    }
    @IBAction func btnCamaraAccion(_ sender: Any) {
    }
    @IBAction func btnGaleriaAccion(_ sender: Any) {
    }
    @IBAction func btnAceptarAccion(_ sender: Any) {
        
        reviewToUpload.producto = txtProducto?.text!
        reviewToUpload.marca = txtMarca?.text!
        reviewToUpload.categoria = "aun no puedes poner categorias"
        reviewToUpload.cons = cons
        reviewToUpload.pros = pros
        reviewToUpload.linkCompra = txtLinkCompra?.text
        reviewToUpload.descripcion = "nono " //txtAreaDescripcion?.text!
        reviewToUpload.images.append("aun no puedes subir imagenes")
        reviewToUpload.userID = "k99EH92bnbS62LdWYR8P" //DataHolder.sharedInstance.myProfile.userID
        reviewToUpload.score = sldScore.value
        
        print(reviewToUpload.getMap())
        let reviewDBRef = DataHolder.sharedInstance.fireStoreDB?.collection("reviews").document()
        //DataHolder.sharedInstance.fireStoreDB?.collection("reviews").
         reviewDBRef?.setData(reviewToUpload.getMap()){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                DataHolder.sharedInstance.myProfile.asReviews.append((reviewDBRef?.documentID)!)
                DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document(self.reviewToUpload.userID!).setData(DataHolder.sharedInstance.myProfile.getMap(), merge: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
