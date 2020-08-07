//
//  zoomController.swift
//  8-3-zoom
//
//  Created by bytedance on 8/3/20.
//

import Foundation
import UIKit

class zoomController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ImageView.imageView.view.center = view.center
        ImageView.imageView.view.isUserInteractionEnabled = true
        view.addSubview(ImageView.imageView.view)
        let zoomGesture = UIPinchGestureRecognizer(target: self, action: #selector(zoomImage(_:)))
        ImageView.imageView.view.addGestureRecognizer(zoomGesture)
    }
    
    @objc func zoomImage(_ gesture:UIPinchGestureRecognizer){
        print("ok")
        ImageView.imageView.view.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
//        gesture.scale = 1
    }
}
