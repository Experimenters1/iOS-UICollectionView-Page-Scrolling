//
//  ViewController.swift
//  Collection
//
//  Created by huy on 18/04/2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sdfsdf", for: indexPath) as! CollectionViewCell
        return cell
    }
    

    @IBOutlet weak var col: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        col.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "sdfsdf")
        
        
        let margin: CGFloat = 12
                    let layout = UICollectionViewFlowLayout()
//                    layout.scrollDirection = .vertical
                   layout.scrollDirection = .horizontal // Chỉnh đổi để cuộn theo chiều ngang
                    layout.minimumLineSpacing = margin
                    layout.minimumInteritemSpacing = margin
                    var sizeCell = (view.frame.size.width - 4 * margin) / 3 - 2
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        sizeCell = (view.frame.size.width - 5 * margin) / 4
                    }
                    
                    layout.itemSize = CGSize(width: sizeCell, height: sizeCell)
                    layout.sectionInset = UIEdgeInsets.init(top: margin, left: margin, bottom: margin, right: margin)
        
        // Đặt tốc độ cuộn chậm hơn
//        col.decelerationRate = UIScrollView.DecelerationRate.fast // Chuyển thành .slow để làm cho cuộn chậm hơn
        col.showsHorizontalScrollIndicator = false // Ẩn thanh cuộn ngang
        col.collectionViewLayout = layout
    }


}

