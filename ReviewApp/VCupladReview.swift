//
//  VCupladReview.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 5/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase
import Toast_Swift
import FontAwesome_swift


class VCupladReview: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
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
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnImgGaleria: UIButton!
    let imagePicker = UIImagePickerController()
    var ImgData:Data?
    
    @IBAction func btnmenuAccion(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    @IBOutlet weak var prosvisualizer: UITextView!
    @IBOutlet weak var consvisualizer: UITextView!
    
    @IBOutlet weak var pvCategoria: UIPickerView!

    @IBOutlet weak var ImgView: UIImageView!
    
    
    
    var pros:[String] = []
    
    var cons:[String] = []
    
    var categorias:[String] = ["Hogar", "Electronica", "Jardin", "Salud y Estetica", "Moda", "Telefonía", "Deportes", "Motor", ]
    
    var reviewToUpload:Review = Review()
    
    
    
    @IBAction func saveProductAccion(_ sender: Any) {
        DataHolder.sharedInstance.sProducto = txtProducto.text!
        
    }
    @IBAction func saveBrandAccion(_ sender: Any) {
        DataHolder.sharedInstance.sMarca = txtMarca.text!
    }
   
    
    
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

    @IBAction func btnAceptarAccion(_ sender: Any) {
        if (DataHolder.sharedInstance.sProducto.isEmpty) {
            self.view.makeToast("El producto está vacío")
        }else {
            
            if(DataHolder.sharedInstance.sMarca?.isEmpty)!{
                self.view.makeToast("La marca está vacía")
            } else{
            
                if (DataHolder.sharedInstance.sDescripcion?.isEmpty)!{
                    self.view.makeToast("La descripción está vacía")
                }
                
                else{
                    
                    if (DataHolder.sharedInstance.sCategory?.isEmpty)! {
                       self.view.makeToast("Seleccione una categoría")
                    } else{
        reviewToUpload.producto = DataHolder.sharedInstance.sProducto
        reviewToUpload.marca = DataHolder.sharedInstance.sMarca!
        reviewToUpload.categoria = DataHolder.sharedInstance.sCategory!
        reviewToUpload.cons = cons
        reviewToUpload.pros = pros
        reviewToUpload.linkCompra = txtLinkCompra?.text
        reviewToUpload.descripcion = DataHolder.sharedInstance.sDescripcion
        reviewToUpload.images.append("aun no puedes subir imagenes")
        reviewToUpload.userID = "k99EH92bnbS62LdWYR8P" //DataHolder.sharedInstance.myProfile.userID
        reviewToUpload.score = sldScore.value.rounded()
        
        print(reviewToUpload.getMap())
        let reviewDBRef = DataHolder.sharedInstance.fireStoreDB?.collection("reviews").document()
        //DataHolder.sharedInstance.fireStoreDB?.collection("reviews").
         reviewDBRef?.setData(reviewToUpload.getMap()){ err in
            if let err = err {
                print("Error writing document: \(err)")
                self.view.makeToast("Error")
            } else {
                print("Document successfully written!")
                DataHolder.sharedInstance.myProfile.asReviews.append((reviewDBRef?.documentID)!)
                DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document(self.reviewToUpload.userID!).setData(DataHolder.sharedInstance.myProfile.getMap(), merge: true)
                self.dismiss(animated: true)
            }
        }
                    }}}}}
    
    override func viewDidLoad() {
        //closeIcon
        btnMenu.titleLabel?.font = UIFont.fontAwesome(ofSize: 25)
        btnMenu.setTitle(String.fontAwesomeIcon(name: .timesCircle), for: .normal)
        //pros icons
        btnPros.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        btnPros.setTitle(String.fontAwesomeIcon(name: .plusCircle), for: .normal)
        borrarPro.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        borrarPro.setTitle(String.fontAwesomeIcon(name: .minusCircle), for: .normal)
        //cons icons
        btnContras.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        btnContras.setTitle(String.fontAwesomeIcon(name: .plusCircle), for: .normal)
        borrarCon.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        borrarCon.setTitle(String.fontAwesomeIcon(name: .minusCircle), for: .normal)
        super.viewDidLoad()
        pvCategoria.dataSource = self
        pvCategoria.delegate = self
        imagePicker.delegate = self
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // picker
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorias.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorias[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DataHolder.sharedInstance.sDescripcion = txtAreaDescripcion.text
        DataHolder.sharedInstance.sCategory = categorias[row]
    }

    @IBAction func btnSubirImagen(_ sender: Any) {

    

}
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        print(img,"------------>>>>>>>>>>")
        ImgView?.image = img
        self.dismiss(animated: true, completion: nil)
        ImgData = UIImageJPEGRepresentation(img!, 0.5)! as Data
    }
    
    
    @IBAction func BtnImgGaleria(){
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
}
