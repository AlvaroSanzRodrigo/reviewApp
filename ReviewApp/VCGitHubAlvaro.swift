//
//  VCGitHubAlvaro.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 13/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import WebKit

class VCGitHubAlvaro: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var webkit: WKWebView!
    @IBAction func btnBackAccion(_ sender: Any) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBack.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        btnBack.setTitle(String.fontAwesomeIcon(name: .timesCircleO), for: .normal)
        let url = URL(string: "https://github.com/AlvaroSanzRodrigo")
        let request = URLRequest(url: url!)
        webkit.load(request)
        // Do any additional setup after loading the view.
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
