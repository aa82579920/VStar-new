//
//  InputViewController.swift
//  V-Star
//
//  Created by 王申宇 on 04/04/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

struct Account {
    static var name = ""
    static var sign = ""
    static var address = ""
    static var sex = ""
    static var birth = ""
}

class InputViewController: UIViewController {
    
    var textview: UITextView!
    var type: Int!
    var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        textview = UITextView()
        view.addSubview(textview)
        textview.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.left.equalTo(view).offset(18)
            make.right.equalTo(view).inset(18)
            make.height.equalTo(view.frame.height / 3)
        }
        btn = UIButton()
        btn.backgroundColor = .starRed
        btn.setTitle("确定", for: .normal)
        btn.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.top.equalTo(textview.snp.bottom).offset(20)
            make.right.equalTo(view).inset(20)
            make.width.equalTo(40)
            make.height.equalTo(28)
        }
    }
    
    @objc func confirm() {
        switch type {
        case 0:
            Account.name = textview.text
        case 1:
            Account.sign = textview.text
        case 2:
            Account.address = textview.text
        case 3:
            Account.sex = textview.text
        default: break
        }
    }
}
