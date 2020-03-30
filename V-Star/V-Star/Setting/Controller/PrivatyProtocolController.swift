//
//  PrivatyProtocolController.swift
//  V-Star
//
//  Created by 王申宇 on 10/03/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import WebKit

class PrivatyProtocolController: UIViewController {
    var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "隐私协议"
        loadHTML()
    }
    
    func loadHTML() {
        SettingHelper.GetPrivateProtocol(success: { userProtocol in
            self.webview = WKWebView()
            self.webview.loadHTMLString(userProtocol.data!.infoContent!, baseURL: nil)
            self.view.addSubview(self.webview)
            self.webview.snp.makeConstraints { make in
                make.edges.equalTo(self.view)
            }
        }) { _ in
        }
    }
    
    
}

