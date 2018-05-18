//
//  VCRegister.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 18/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCRegister: UIViewController {

    @IBOutlet weak var txtfEmailRg: UITextField!
    @IBOutlet weak var txtfpass1Rg: UITextField!
    @IBOutlet weak var txtfpass2: UITextField!
    @IBOutlet weak var DatePickerbirthday: UIDatePicker!
    @IBOutlet weak var txtfGender: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func okRegister(_ sender: Any) {
    }
    


}
