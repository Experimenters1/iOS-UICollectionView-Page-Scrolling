# iOS-UICollectionView-Page-Scrolling
## iOS UICollectionView Page Scrolling


```swift
    override func viewDidLoad() {
        super.viewDidLoad()

    layout.scrollDirection = .horizontal // Chỉnh đổi để cuộn theo chiều ngang

     layout.scrollDirection = .horizontal // Chỉnh đổi để cuộn theo chiều ngang

       col.decelerationRate = UIScrollView.DecelerationRate.fast // Chuyển thành .slow để làm cho cuộn chậm hơn

      col.showsHorizontalScrollIndicator = false // Ẩn thanh cuộn ngang

}

```

