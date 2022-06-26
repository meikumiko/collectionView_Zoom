//
//  collectionViewController.swift
//  scrollViewDelegate
//
//  Created by Hsiao-Han Chi on 2022/6/21.
//

import UIKit

class collectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    func setupFlowLayout(){
        let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        //項目的預設大小為collection view的大小
        flowLayout?.itemSize = collectionView.bounds.size
        flowLayout?.estimatedItemSize = .zero
        //同一行項目間的最小距離
        flowLayout?.minimumInteritemSpacing = 0
        //行跟行之間的最小距離
        flowLayout?.minimumLineSpacing = 0
        //邊距
        flowLayout?.sectionInset = .zero
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.backgroundStyle = .prominent
        setupFlowLayout()

        // Do any additional setup after loading the view.
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //設定cell的索引路徑
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(collectionViewCell.self)", for: indexPath) as! collectionViewCell
        
        //設置cell內容
        cell.imageView.image = UIImage(named: "fabia-\(indexPath.item + 1)")
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
 
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let collectionViewCell = cell as? collectionViewCell
        collectionViewCell?.updateZoom()
        //呼叫updateZoom function設定cell要顯示的初始狀態
        //updateZoom的function寫在collectionViewCell的Class中
    }
    
    
    @IBAction func changePage(_ sender: UIPageControl) {
        //畫面捲動是靠collection view執行，所以用collection View的寬乘以當前頁數，來得到collection view應該捲動到的x座標
        let newPoint = CGPoint(x: collectionView.bounds.width * CGFloat(sender.currentPage), y: 0)
        //設定collection View應該捲動到的新座標為剛剛算出來newPoint
        collectionView.setContentOffset(newPoint, animated: true)
    }
 
    

}

