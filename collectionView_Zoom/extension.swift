//
//  extension.swift
//  scrollViewDelegate
//
//  Created by Hsiao-Han Chi on 2022/6/20.
//

import Foundation
import UIKit


extension collectionViewController: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        pageControl.currentPage = Int(page)
    }
}
