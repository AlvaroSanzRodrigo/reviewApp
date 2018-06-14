//
//  VCUploadRev.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 29/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCUploadRev: UIViewController {

    @IBOutlet weak var btnUploadPic: UIButton!
    @IBOutlet weak var btnTakePic: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //gallery icon
        btnUploadPic.titleLabel?.font = UIFont.fontAwesome(ofSize: 60)
        btnUploadPic.setTitle(String.fontAwesomeIcon(name: .image), for: .normal)
        //camera icon
        btnTakePic.titleLabel?.font = UIFont.fontAwesome(ofSize: 60)
        btnTakePic.setTitle(String.fontAwesomeIcon(name: .cameraRetro), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
