//
//  VCAbout.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 13/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FontAwesome_swift

class VCAbout: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtAAbout: UITextView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var lblPablo: UILabel!
    @IBOutlet weak var lblAlvaro: UILabel!
    @IBOutlet weak var btnGitHubAlvaro: UIButton!
    @IBOutlet weak var btnCVAlvaro: UIButton!
    @IBOutlet weak var btnGitHubPablo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.font = UIFont.fontAwesome(ofSize: 17)
        lblTitle.text = String.fontAwesomeIcon(name: .apple) + "   Ápagarélmac   " + String.fontAwesomeIcon(name: .mobilePhone)
        txtAAbout.font = UIFont.fontAwesome(ofSize: 20)
        txtAAbout.text.append(String.fontAwesomeIcon(name: .heart))
        btnClose.titleLabel?.font = UIFont.fontAwesome(ofSize: 25)
        btnClose.setTitle(String.fontAwesomeIcon(name: .timesCircle), for: .normal)
        lblAlvaro.font = UIFont.fontAwesome(ofSize: 17)
        lblAlvaro.text = String.fontAwesomeIcon(name: .spaceShuttle) + "  Alvaro"
        lblPablo.font = UIFont.fontAwesome(ofSize: 17)
        lblPablo.text = String.fontAwesomeIcon(name: .angellist) + "   Pablo"
        btnGitHubAlvaro.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        btnGitHubAlvaro.setTitle(String.fontAwesomeIcon(name: .github), for: .normal)
        btnGitHubPablo.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        btnGitHubPablo.setTitle(String.fontAwesomeIcon(name: .github), for: .normal)
        btnCVAlvaro.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        btnCVAlvaro.setTitle(String.fontAwesomeIcon(name: .addressCard), for: .normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCloseAccion(_ sender: Any) {self.dismiss(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
