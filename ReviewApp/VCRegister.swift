//
//  VCRegister.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 18/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase
import Toast_Swift

class VCRegister: UIViewController {

    @IBOutlet weak var txtfEmailRg: UITextField!
    @IBOutlet weak var txtfpass1Rg: UITextField!
    @IBOutlet weak var txtfpass2: UITextField!
    @IBOutlet weak var DatePickerbirthday: UIDatePicker!
    @IBOutlet weak var txtfGender: UITextField!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func okRegister(_ sender: Any) {
        
        if (txtfEmailRg.text == "" || txtNombre.text == "" || txtfGender.text=="" || txtfpass1Rg.text=="" || txtfpass2.text=="" || txtfpass1Rg.text != txtfpass2.text){
            if (txtNombre.text==""){
                 self.view.makeToast("Introduzca nombre")
            }else if(txtfEmailRg.text==""){
                self.view.makeToast("Introduzca email")
            }else if (txtfpass1Rg.text==""){
                self.view.makeToast("Introduzca Contraseña")
            }else if (txtfpass2.text==""){
                self.view.makeToast("Vuela a Contraseña")
            }else if (txtfGender.text==""){
                self.view.makeToast("Introduzca Genero")
            }else if (txtfpass1Rg.text! != txtfpass2.text!){
                self.view.makeToast("Las contraseñas no coinciden")
            }
        }else{
            
           DataHolder.sharedInstance.regitro(txtFieldEmail: txtfEmailRg.text!, txtFieldPssw: txtfpass2.text!, edad: Timestamp(date: DatePickerbirthday.date), txtFieldUser:txtNombre.text!, gender: txtfGender.text!)
            self.performSegue(withIdentifier: "okRegisterSG", sender: self)
        }
        
    }
    
    


}
