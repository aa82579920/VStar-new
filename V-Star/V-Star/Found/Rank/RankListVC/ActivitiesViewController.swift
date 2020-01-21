//
//  ActivitiesViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/28.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class ActivitiesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ActivitiesViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
