//
//  DataHolder.swift
//  ReviewApp
//
//  Created by Alvaro Sanz Rodrigo on 18/05/2018.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase

class DataHolder: NSObject {
    
    static let sharedInstance = DataHolder();
    
    var hello : String = "hola"
    
    var fireStoreDB:Firestore?
    
    var storage:Storage?
    
    var storageRef:StorageReference?
    
    var myProfile:Perfil = Perfil();
    
    func initFireBase() {
        
        FirebaseApp.configure()
        
        fireStoreDB = Firestore.firestore()
        
        storage = Storage.storage()
        
        storageRef = storage?.reference()
        
    }
    
    func regitro(delegate:DataHolderDelegate, txtFieldEmail:String, txtFieldPssw:String, edad:Int, txtFieldUser:String, gender:String) {
        var allNice:Bool = false
        
        Auth.auth().createUser(withEmail: (txtFieldEmail), password: (txtFieldPssw)) { (user, error) in
            
            if error == nil{
                
                DataHolder.sharedInstance.myProfile.iEdad = edad
                DataHolder.sharedInstance.myProfile.sNombreUsuario = txtFieldUser
                DataHolder.sharedInstance.myProfile.sGender = gender
                DataHolder.sharedInstance.myProfile.userID = user?.uid
                DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.myProfile.getMap()) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(String(describing: user?.uid))")
                    }
                }
                
                
                if user != nil {
                    
                    allNice = true
                    
                    let refPerfil = DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!)
                    refPerfil?.getDocument(completion: { (document, errordoc) in
                        if document != nil {
                            
                            DataHolder.sharedInstance.myProfile.setMap(valores: (document?.data())!, user: (user?.uid)!)
                            delegate.DHDregistro(allnice: allNice)
                            
                        }else{
                            print(error!)
                        }
                    })
                    
                } else{
                    print(error!)
                }
                
                
                
                
            }
            else {
                print("Error! ", error!)
            }
        }
    }
    

}
