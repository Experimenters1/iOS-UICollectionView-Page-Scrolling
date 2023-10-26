//
//  ViewController.swift
//  test3
//
//  Created by Huy Vu on 10/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    var img:[String] = ["hoang","hung","huy","huy1"]
    
    var selectedImageName: String?


    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
        
        
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
        collectionView.showsHorizontalScrollIndicator = false // Ẩn thanh cuộn ngang
        collectionView.collectionViewLayout = layout
    }


}

extension ViewController:  UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.img_t.image = UIImage(named: img[indexPath.row])
//        cell.img_t.layer.cornerRadius = 50
        
        // Tạo một UITapGestureRecognizer cho mỗi ô
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
           cell.img_t.isUserInteractionEnabled = true
           cell.img_t.addGestureRecognizer(tapGesture)
        
        
        
        return cell
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView, let image = imageView.image {
            if let imageName = img.first(where: { UIImage(named: $0) == image }) {
                selectedImageName = imageName
                print("Selected Image: \(selectedImageName ?? "Unknown")")
            }
        }
    }
    
    
}
