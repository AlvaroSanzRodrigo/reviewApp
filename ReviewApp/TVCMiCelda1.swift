//
//  TVCMiCelda1.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 14/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class TVCMiCelda1: UITableViewCell {
    
    var reviewID:String?
    
    @IBOutlet weak var lblProd: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var lblScore: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
