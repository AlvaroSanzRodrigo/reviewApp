//  VCPrincipal.swift
//  ReviewApp
//
//  Created by Álvaro Sanz Rodrigo on 14/6/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCPrincipal: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("HOlA ", DataHolder.sharedInstance.reviews.count)
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let miCelda1:TVCMiCelda1 = tableView.dequeueReusableCell(withIdentifier: "miCelda1") as! TVCMiCelda1
        if !DataHolder.sharedInstance.reviews.isEmpty {
            miCelda1.lblProd?.text = DataHolder.sharedInstance.reviews[indexPath.row].producto
            miCelda1.lblBrand?.text = DataHolder.sharedInstance.reviews[indexPath.row].marca
            miCelda1.lblScore?.text = "\(String(describing: DataHolder.sharedInstance.reviews[indexPath.row].score!))"
            miCelda1.lblCategory?.text = DataHolder.sharedInstance.reviews[indexPath.row].categoria
            miCelda1.reviewID = "\(indexPath.row)"
        }
        return miCelda1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataHolder.sharedInstance.selectedReview = indexPath.row
        present(storyboard!.instantiateViewController(withIdentifier: "reviewView"), animated: true)
    }
    
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var reviewTable: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reviewTable.delegate = self
        reviewTable.dataSource = self
        self.reviewTable.reloadData()
        //icons
        btnMenu.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        btnMenu.setTitle(String.fontAwesomeIcon(name: .bars), for: .normal)
        //download reviews.
        if DataHolder.sharedInstance.reviews.isEmpty {
            print("Esto ", DataHolder.sharedInstance.reviews.count)
            DataHolder.sharedInstance.descargarReviews(delegate: self)
        }
    
    }
    func DHDdescargaReviewsComplete(allnice: Bool) {
        if allnice {
            print("allnice: \(allnice)", " ",  DataHolder.sharedInstance.reviews.count)
            self.reviewTable.reloadData()
            print("Hola")
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
