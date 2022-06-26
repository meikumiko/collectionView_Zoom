//
//  collectionViewCell.swift
//  scrollViewDelegate
//
//  Created by Hsiao-Han Chi on 2022/6/21.
//

import UIKit

class collectionViewCell: UICollectionViewCell {
//    static let reuseIdentifier = "\(collectionViewCell.self)"
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    //讓圖片維持置中
    func updateContentInset(){
        //讀取圖片的寬跟高
        if let imageWidth = imageView.image?.size.width, let imageHeight = imageView.image?.size.height{
            //計算圖片等比例縮小到能放進顯示框中的時候，圖片寬跟高與顯示框的寬跟高的留白差距，因為置中時圖片左右兩邊或上下兩邊跟顯示框的距離會是一樣的，所以除以2
            let insetWidth = (bounds.width - imageWidth * scrollView.zoomScale) / 2
            let insetHeight = (bounds.height - imageHeight * scrollView.zoomScale) / 2
            scrollView.contentInset = .init(top: max(insetHeight, 0), left: max(insetWidth, 0), bottom: 0, right: 0)
        }
    }
     
    
    func updateZoom(){
        if let imageSize = imageView.image?.size{
            //計算顯示框的寬跟高和圖片的寬跟高的比率
            let widthScale = bounds.size.width / imageSize.width
            let heightScale = bounds.size.height / imageSize.height
            //兩者間較小的比率就是圖片能縮放到完整顯示在顯示框的比率
            let scale = min(widthScale, heightScale)
            scrollView.minimumZoomScale = scale //scroll view內容最小的縮放範圍
            scrollView.maximumZoomScale = max(widthScale, heightScale) //scroll view內容的最大的縮放範圍
            scrollView.zoomScale = scale //scroll view內容大小的初始值
            
            //scrollViewDidZoom有可能還沒處發，所以這邊先呼叫一次
            updateContentInset()
        }
    }
    
}

extension collectionViewCell: UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView //縮放時影響的對象
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateContentInset()
    }
}
