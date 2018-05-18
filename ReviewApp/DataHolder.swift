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
    
    func initFireBase() {
        
        FirebaseApp.configure()
        
        fireStoreDB = Firestore.firestore()
        
        storage = Storage.storage()
        
        storageRef = storage?.reference()
        
    }
    
    
    

}
