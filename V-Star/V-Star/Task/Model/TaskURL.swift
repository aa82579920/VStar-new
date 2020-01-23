//
//  TaskURL.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

//MARK: - 红包
struct Task {
    static let getWeekInfo = "/task/getWeekInfo"             //查看本周情况
    static let signDay = "/task/signDay"                     //签到
    static let watchOneTime = "/task/watchOneTime"           //记录用户今日浏览了一个视频
    static let getWatchMoney = "/task/getWatchMoney"         //领取浏览红包
    static let uploadOneTime = "/task/uploadOneTime"         //记录用户今日发布了一个视频
    static let getUploadMoney = "/task/getUploadMoney"       //领取发布红包
    static let getInvitationCode = "/task/getInvitationCode" //获取邀请码
    static let getInvitationLog = "/task/getInvitationLog"   //获取当前用户本周邀请记录
    static let userInvitationCode = "/task/useInvitationCode"//使用邀请码
    static let chechInvitationCode = "/task/checkInvitationCode"//检查邀请码是否可用
}
//MARK: - 订单
struct Order {
    static let create = "/order/create"      //新建订单
    static let update = "/order/update"      //修改订单
}

