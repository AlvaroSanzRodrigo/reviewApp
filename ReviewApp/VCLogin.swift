//
//  VCLogin.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 18/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase

class VCLogin: UIViewController {

    @IBOutlet weak var txtfEmail: UITextField!
    @IBOutlet weak var txtfPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okLogin(_ sender: Any) {
        Auth.auth().signIn(withEmail: (txtfEmail?.text)!, password: (txtfPassword?.text)!) { (user, error) in
            if user != nil {
                let refPerfil = DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!)
                refPerfil?.getDocument(completion: { (document, errordoc) in
                    if document != nil {
                        
                        DataHolder.sharedInstance.myProfile.setMap(valores: (document?.data())!, user: (user?.uid)!)
                        self.performSegue(withIdentifier: "okLoginSG", sender: self)
                    }else{
                        print(error!)
                    }
                })
                
            } else{
                print(error!)
            }
        }
    }
    
    

}
