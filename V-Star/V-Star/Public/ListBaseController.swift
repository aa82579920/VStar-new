//
//  ListBaseController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class ListBaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListBaseController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
    
    
}
