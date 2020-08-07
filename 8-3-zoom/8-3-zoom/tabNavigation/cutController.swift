//
//  cutController.swift
//  8-3-zoom
//
//  Created by bytedance on 8/3/20.
//

import Foundation
import UIKit


class myView : UIView{
    var beginAngle = Double.pi/2*3
    var finishAngle = Double.pi/2*3+Double.pi*2/20
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let color = UIColor.white
        color.set()
        let aPath = UIBezierPath(arcCenter: CGPoint(x:200,y:300), radius: 75, startAngle: (CGFloat)(beginAngle), endAngle: (CGFloat)(finishAngle), clockwise: true)
        aPath.addLine(to: CGPoint(x: 200, y: 300))
        aPath.close()
        aPath.lineWidth = 5.0
        aPath.fill(with: .normal, alpha: 0.5)
        finishAngle += Double.pi/20
    }
}



class cutController:UIViewController{
    
    var _myView : myView!
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        _myView = myView()
        _myView.frame = self.view.bounds
        view.addSubview(_myView)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        ImageView.imageView.view.center = view.center
//        ImageView.imageView.view.isUserInteractionEnabled = true
//        view.addSubview(ImageView.imageView.view)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.reDraw), userInfo: nil, repeats: true)
        
    }
    
    @objc func reDraw(){
        _myView.setNeedsDisplay()
        if _myView.finishAngle>_myView.beginAngle+Double.pi*2.3{
            timer.invalidate()
        }
    }
    
    
}


