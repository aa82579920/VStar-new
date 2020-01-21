//
//  UserFandomList.swift
//  V-Star
//
//  Created by 王春杉 on 2019/10/27.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// 我的 - 粉丝圈数据
struct UserFandomList {
    var myUserFandom = [MyUserFandom]()
    var otherUserFandom = [OtherUserFandom]()
}

struct MyUserFandom {
    var host_user_ID = 0
    var host_username = ""
    var host_avatar = ""
    var fans_num = 0
}

struct OtherUserFandom {
    var host_user_ID = 0
    var host_username = ""
    var host_avatar = ""
}

struct FandomInfo {
    var host_username = ""
    var month_rank = 0
    var fans_num = 0
    var fandom_user_num = 0
    var is_into = false
    var total_hot: String? = ""
    var total_work_num = 0
    var total_fandom_action_num = 0
}

struct RecentActions {
    var current_page = 0
    var last_page = 0
    var data = [RecentActionsData]()
}

struct RecentActionsData {
    var fandom_action_ID = 0
    var time = ""
    var user_ID = 0
    var username = ""
    var avatar = ""
    var content = ""
    var img_IDs = ""
    var img_urls = [String]()
}
