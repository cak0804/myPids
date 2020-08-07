//
//  ViewController.swift
//  8-3-zoom
//
//  Created by bytedance on 8/3/20.
//

import UIKit




class ViewController: UIViewController {
    var testView : UIView!
    var imgview : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
//
//
//
////
   
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        imgview = ImageView.imageView.view
        
        imgview.center = view.center
        imgview.isUserInteractionEnabled = true
        view.addSubview(imgview)
        
//
    }
    
    

}

