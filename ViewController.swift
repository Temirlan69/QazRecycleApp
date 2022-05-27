//
//  ViewController.swift
//  QazRecycle
//
//  Created by Tima on 24.04.2022.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webSeriesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        as! MyCollectionCell
        cell.MyWebImage.image=UIImage(named: webSeriesImages[indexPath.row])
        cell.MyWebImage.layer.cornerRadius=50.0
        return cell
        
    }
    
    var webSeriesImages:[String] = ["Image-53", "Image-54", "Image-55"]
//    var currentPage:Int=0
    
        

    @IBOutlet weak var MyPage: UIPageControl!
    
    
    @IBOutlet weak var labl: UILabel!
    @IBAction func slider(_ sender: UISlider) {
        labl.text = String(Int(sender.value))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MyPage.currentPage=0
        MyPage.numberOfPages=webSeriesImages.count
        
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        MyPage.currentPage=indexPath.row
    }
  
}

