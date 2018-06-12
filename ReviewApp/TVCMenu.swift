//
//  TVCMenu.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 12/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FontAwesome_swift

class TVCMenu: UITableViewController {


    @IBOutlet weak var lblPerfil: UILabel!
    @IBOutlet weak var lblUploadReview: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPerfil.text = "Prueba"
        lblUploadReview.font = UIFont.fontAwesome(ofSize: 17)
        lblUploadReview.text = String.fontAwesomeIcon(name: .upload) + " Subir Review"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){
        present(storyboard!.instantiateViewController(withIdentifier: "prueba"), animated: true)
        } else if (indexPath.row == 1){
            present(storyboard!.instantiateViewController(withIdentifier: "uploadReview"), animated: true)
        }else{print("holi")}
    }

    
}
