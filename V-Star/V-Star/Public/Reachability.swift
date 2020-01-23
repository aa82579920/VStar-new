//
//  Reachability.swift
//  V-Star
//
//  Created by 王申宇 on 2019/10/30.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import SystemConfiguration
import Network
//网络监听

enum PVNetworkStatus: Int {
    case notReachable = 0
    case reachableViaWiFi
    case reachableViaWWAN
}

class Reachability: NSObject {
    
}

