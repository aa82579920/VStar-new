//
//  UserProtocolController.swift
//  V-Star
//
//  Created by 王申宇 on 10/03/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import WebKit

struct Protocols {
    static let user = "/setting/getUserProtocol"
    static let privacy = "/setting/getPrivacyProtocol"
}
class UserProtocolController: UIViewController {
    var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "用户协议"
        loadHTML()
    }
    
    func loadHTML() {
        SettingHelper.GetUserProtocol(success: { userProtocol in
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
