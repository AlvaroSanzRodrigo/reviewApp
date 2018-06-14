//
//  Review.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 18/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class Review: NSObject {
    
    var images: [String] = []
    
    var producto: String?
    
    var marca: String?
    
    var categoria: String?
    
    var pros: [String] = []
    
    var cons: [String] = []
    
    var linkCompra: String?
    
    var userID: String?
    
    var descripcion: String?
    
    var score: Float?
    
    
    func setMap(valores:[String:Any]){
        
        images = valores["images"] as! [String]
        
        producto = valores["producto"] as? String
        
        marca = valores["marca"] as? String
        
        categoria = valores["categoria"] as? String
        
        pros = valores["pros"] as! [String]
        
        cons = valores["cons"] as! [String]
        
        linkCompra = valores["linkcompra"] as? String
        
        userID = valores["user"] as? String
        
        descripcion = valores["descripcion"] as? String
        
        score = valores["score"] as? Float
        
    }
    
     func getMap() -> [String:Any] {
        var valores:[String:Any] = [:]
        
        valores["images"] = images
        
        valores["producto"] = producto
        
        valores["marca"] = marca
        
        valores["categoria"] = categoria
        
        valores["pros"] = pros
        
        valores["cons"] = cons
        
        valores["linkcompra"] = linkCompra
        
        valores["user"] = userID
        
        valores["descripcion"] = descripcion
        
        valores["score"] = score
        
        return valores
        
    }

}
