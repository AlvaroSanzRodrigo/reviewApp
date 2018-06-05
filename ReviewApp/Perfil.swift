//
//  Perfil.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 18/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase

class Perfil: NSObject {
    
    var iEdad:Timestamp?
    
    var sNombreUsuario:String?
    
    var sGender:String?
    
    var asReviews:[String] = []
    
    var userID:String?
    
    func setMap(valores:[String:Any], user:String){
        
        iEdad = valores["edad"] as? Timestamp
        
        sNombreUsuario = valores["user"] as? String
        
        sGender = valores["gender"] as? String
        
        userID = user
        
        asReviews = (valores["reviews"] as? [String])!

    }
    
    func getMap() -> [String:Any] {
        
        var mapTemp:[String:Any] = [:]
        
        mapTemp["edad"] = iEdad as Any
        
        mapTemp["user"] = sNombreUsuario as Any
        
        mapTemp["gender"] = sGender as Any
        
        mapTemp["reviews"] = asReviews as Any
        
        return mapTemp
        
    }

}
