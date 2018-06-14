//
//  VCReview.swift
//  ReviewApp
//
//  Created by PABLO GUARDADO ALVAREZ on 29/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCReview: UIViewController, UIScrollViewDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var btnClose: UIButton!
    var laTrampa:Int?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtaPros: UITextView!
    @IBOutlet weak var txtaCons: UITextView!
    @IBOutlet weak var txtaDescription: UITextView!
    
    
    @IBAction func btnCloseAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    var contentWidth:CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        laTrampa = DataHolder.sharedInstance.selectedReview
        
        // Descripcion
        lblTitle.text = DataHolder.sharedInstance.reviews[laTrampa!].producto! + " " +  DataHolder.sharedInstance.reviews[laTrampa!].marca!
        for pro in DataHolder.sharedInstance.reviews[laTrampa!].pros {
            txtaPros.text.append("\n" + pro)
        }
        for con in DataHolder.sharedInstance.reviews[laTrampa!].cons {
            txtaPros.text.append("\n" + con)
        }
        txtaDescription.text = DataHolder.sharedInstance.reviews[laTrampa!].descripcion
        scrollView.delegate = self
        
        for image in 0...2 {
            let imageToDisplay = UIImage(named: "\(image).png")
            let imageView = UIImageView(image: imageToDisplay)
            
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(image)
            contentWidth += view.frame.width
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: xCoordinate - 100, y: (0) + 25, width: 200, height: 200)
        }
        scrollView.contentSize = CGSize(width:contentWidth, height:200)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        pageControll.currentPage = Int(scrollView.contentOffset.x / CGFloat(375))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
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
