//
//  filterController.swift
//  8-3-zoom
//
//  Created by bytedance on 8/3/20.
//

import Foundation
import UIKit

var redArr = [CGFloat]()
var greenArr = [CGFloat]()
var blueArr = [CGFloat]()



class filterController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    var myCollectionView : UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionCell
        let red =  CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        redArr.append(red)
        greenArr.append(green)
        blueArr.append(blue)
        
        cell.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        cell.cellView.backgroundColor = cell.backgroundColor
//        cell.label.backgroundColor = cell.backgroundColor
        if(indexPath.row==0){
            cell.label.text = "原图"
        }
        else{
            cell.label.text = "滤镜\(indexPath.row)"
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.backgroundColor = UIColor.white
        var filter: CIFilter!
        switch indexPath.row {
        case 0:
            filter = CIFilter(name: "CISepiaTone")!
        case 1:
            filter = CIFilter(name: "CIExposureAdjust")!
        case 2:
            filter = CIFilter(name: "CIGaussianBlur")!
        case 3:
            filter = CIFilter(name: "CIMotionBlur")!
        case 4:
            filter = CIFilter(name: "CIHueAdjust")!
        default:
            filter = CIFilter(name: "CIColorPosterize")!
        }
        guard let pic = ImageView.imageView.view.image else { return  }
        filter.setValue(CIImage(image: pic), forKey: kCIInputImageKey)
        let ctx = CIContext(options:nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: CGRect(x: 0, y: 0, width: 200, height: 200))
        ImageView.imageView.view.image = UIImage(cgImage: (cgImage ?? pic.cgImage)!)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let row = indexPath.row
        cell?.backgroundColor = UIColor(red: redArr[row], green: greenArr[row], blue: blueArr[row], alpha: 0.8)
    }
    
    
    var imgview : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.2, green: 0.1, blue: 0.15, alpha: 1)
//        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
//        btn.center.x = view.center.x
//        btn.center.y = view.center.y+view.frame.size.height/2.0-80
//        view.addSubview(btn)
//
//        btn.setTitle("滤镜", for: UIControl.State.normal)
//        btn.backgroundColor = UIColor.black
//        btn.addTarget(self, action: #selector(filter), for: UIControl.Event.touchUpInside)
//
        let layout = UICollectionViewFlowLayout()
        //设置组内间距
        layout.sectionInset = UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
//        layout.
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.itemSize = CGSize(width: (view.frame.width-80)/3, height: (view.frame.width-80)/3)
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: (view.frame.width-50)/3),collectionViewLayout: layout)
        collection.center.y = self.view.center.y+view.frame.size.height/2.0-110
        collection.backgroundColor = self.view.backgroundColor
        view.addSubview(collection)
        self.myCollectionView = collection
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(collectionCell.self, forCellWithReuseIdentifier: "cell")
        
        let label = UILabel(frame: CGRect(x: 10, y: self.myCollectionView.frame.origin.y-20, width: 40, height: 20))
        label.text = "滤镜"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.white
        self.view.addSubview(label)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ImageView.imageView.view.center = view.center
        ImageView.imageView.view.isUserInteractionEnabled = true
        view.addSubview(ImageView.imageView.view)
    }
    
    @objc func filter(){
        print("filter")
        guard let pic = ImageView.imageView.view.image else { return  }
        let filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(CIImage(image: pic), forKey: kCIInputImageKey)
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        let ctx = CIContext(options:nil)
        
        let cgImage = ctx.createCGImage(filter.outputImage!, from: CGRect(x: 0, y: 0, width: 200, height: 200))
        ImageView.imageView.view.image = UIImage(cgImage: (cgImage ?? pic.cgImage)!)
    }
}


class collectionCell: UICollectionViewCell{
    var cellView: UIView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.cellView = {
            let cell = UIView()
            cell.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)
//            cell.backgroundColor = UIColor.yellow
            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.layer.cornerRadius = 3
            return cell
        }()
        self.label = {
            let label = UILabel()
//            label.backgroundColor = UIColor.black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.textColor = UIColor(red: 0.2, green: 0.1, blue: 0.1, alpha: 0.8)
            return label
        }()
        addSubview(cellView)
        cellView.addSubview(self.label)
        NSLayoutConstraint.activate([
            self.cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            self.cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -2),
            self.cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2),
            self.cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2)
        ])
        NSLayoutConstraint.activate([
            self.label.centerYAnchor.constraint(equalTo: self.cellView.centerYAnchor),
            self.label.centerXAnchor.constraint(equalTo: self.cellView.centerXAnchor)
        ])
    }
}
