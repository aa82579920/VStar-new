//
//  RecommendVC.swift
//  V-Star
//
//  Created by 王申宇 on 2019/9/5.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController {
    
    var collectonView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configUI() {
        layout.itemSize = CGSize(width: view.frame.size.width / 2, height: 270)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        collectonView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: view.bounds.height - 110), collectionViewLayout: layout)
//        collectonView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
    }
}
