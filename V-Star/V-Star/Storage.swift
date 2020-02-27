//
//  Storage.swift
//  V-Star
//
//  Created by 王申宇 on 2019/9/10.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

//MARK: - 信息库
struct PublicParameter {
    static var secretKey = PublicParameter.appKey + String.md5(str: PublicParameter.requestTime)
    static var requestTime = String.getDateNow()
    static var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmJ1aWxkc3Rhci50b3A6ODg4OFwvYXBpXC91c2VyXC9sb2dpbiIsImlhdCI6MTU4MjcyMDU3MywiZXhwIjoxNTgyODA2OTczLCJuYmYiOjE1ODI3MjA1NzMsImp0aSI6IllPNjZWZE8wTGpTSm1jdloiLCJzdWIiOjE3LCJwcnYiOiI1NjAzYTVkYzY4NDI1ZTQzZDdkNTA3ZjFlYjQ2OGE2MjdhYjQzY2YyIn0.p_yilp_5aPmCxstHWegbIPiLKb7mVbaO1VxYxX_7QPk"
    static let appKey = "af4dg52ed%3@"
    static var userID = MyStorage.userID
}

struct MyStorage {
    static var username = ""          //用户名
    static var password = ""          //密码
    static var userID = 0            //id
    static var avatar = ""             //头像（小于20M）
    static var cityName = ""          //城市
    static var sex = 0                //性别（1男2女）
    static var age = 0                //年龄
    static var signature = ""         //个性签名
    static var tags = [String]()      //标签
    static var limit = 3              //关注或评论每页返回的条数
    static var page = 0               //关注或评论页数
    static var nickname = ""           // 昵称
    static var rank = ""

}

struct WorkStorage {
    static var userID = ""            //作者ID(可以是动态/作品/评论/评论的评论的作者）
    static var workId = ""            //作品id
    static var videoId = ""           //视频id
    static var commentId = ""         //评论id
    static var commentContent = ""    //评论内容
    static var ccID = ""              //评论的评论id
    static var toUserID = ""          //他人ID
    static var actionID = ""          //动态ID
    static var acContent = ""         //动态评论内容
    static var beAtUserID = ""        //被@的用户ID(半角逗号拼接）
    static var acID = ""              //动态评论ID
    static var accContent = ""        //动态评论的评论的内容
    static var accID = ""             //动态评论的评论ID
    static var ext = ""               //图片扩展名，比如jpg
    static var imgIDs = ""            //图片ID的拼接，用半角逗号
    static var actionContent = ""     //动态内容
    static var key = ""               //at关键字
    static var messageContent = ""    //私信内容
    static var model = 0              //私信参数（1全部，2未读）
    static var messageID = ""         //私信ID
    static var num = 0                //榜单返回数
    static var history = "1,2"     //播放历史
    static var habit = "2,0,0,0,0,0"       //播放习惯
    static var mode = 1               //mode = 1 hot_first
                                      //mode = 2 time_first
    static var collectionNum = 0
}

//URL
struct VStar_URL {
    static let baseURL = "https://api.buildstar.top:8888/api"
    struct user {
        static let register = "/user/register"          //注册
        static let login = "/user/login"                //登录
        static let myself = "/user/myself"              //个人信息
        static let update = "/user/update"              //上传个人信息
        static let logout = "/user/logout"              //登出
        static let spotlist = "/user/spotList"          //关注列表
        static let collection = "/user/collection"      //收藏
        static let fans = "/user/getFuns"               //粉丝列表
        static let followUserVideoAction = "/user/getFollowUserVideoAction"
        //获取关注者的作品动态
        static let recommendUser = "/user/getRecommendUser"
        //推荐用户
    }
    struct comment {
        static let index = "/comment/index"             //获取评论
        static let create = "/comment/create"           //创建评论
        static let delete = "/comment/delete"           //删除---
        static let update = "/comment/update"           //修改---
        static let getCC = "/comment/getCC"             //获取评论的评论
        static let createCC = "/comment/createCC"       //创建--------
        static let deleteCC = "/comment/deleteCC"       //删除--------
        static let updateCC = "/comment/updateCC"       //修改--------
    }
    static let search = "/search"                       //搜索
    struct follow {
        static let add = "/follow/add"                  //添加关注
        static let delete = "/follow/delete"            //取消关注
    }
    static let banner = "/banner/getRecentBannerByType" //banner
    struct action {
        static let recentAction = "/action/getRecentActions"
        //获取最新动态
        static let commentByActionID = "/action/getCommentByActionID"
        //根据动态ID获取动态的评论
        static let sendActionComment = "/action/sendActionComment"
        //对动态进行评论
        static let deleteActionComment = "/action/deleteActionComment"
        //删除动态评论
        static let getCommentCommentByAcID = "/action/getCommentCommentByAcID"
        //获取动态评论的评论
        static let sendActionCommentComment = "/action/sendActionCommentComment"
        //对动态的评论进行评论
        static let daleteActionCommentComment = "/action/deleteActionCommentComment"
        //删除动态评论的评论
        static let updateActionImage = "/action/uploadActionImage"
        //获取动态图片上传地址
        static let sendNewAction = "/action/sendNewAction"
        //发表动态
        static let getAtUserList = "/action/getAtUserList"
        //获取at列表
    }
    
    struct message {
        static let sendMessage = "/message/sendMessage" //发送私信
        static let getMessageByUserID = "/message/getMessageByUserID"
        //获取某用户的全部私信
        static let getMessageByID = "/message/getMessageByID"
        //根据私信ID获取某一条私信
        static let setMessageRead = "/message/setMessageRead"
        //设为已读
    }
    
    struct rank {
        static let getWorkweekRank = "/workRank/getWeekRank"
        static let getWorkmonthRank = "/workRank/getMonthRank"
        static let getWorkyearRank = "/workRank/getYearRank"//获取作品周/月/年榜
        static let getUserweekRank = "/userRank/getWeekRank"
        static let getUsermonthRank = "/userRank/getMonthRank"
        static let getUseryearRank = "/userRank/getYearRank"//获取用户周/月/年榜
    }
    
    struct work {
        static let getWorkTypes = "/work/getWorkTypes"//获取类型
        static let getWorkByID = "/work/getWorkByID"  //根据workID获取视频详情
        static let getRecommendWork = "/work/getRecommendWork"//根据用户习惯获取推荐
        static let deleteWorkByID = "/work/deleteWorkByID"//根据workID删除作品
        static let getWorkByUserID = "/work/getWorkByUserID"//根据用户ID获取该用户所有作品
        static let getWorkByTypeID = "/work/getWorkByTypeID"//按类型ID获取作品
        static let addCollection = "/work/addCollection"
        static let deleteCollection = "/work/deleteCollection"
        static let deleteCollectionByWork = "/work/deleteCollectionByWork"
    }
    
    struct fanCircle {
        static let getUserFandomList = "/fandomAction/getUserFandomList" // 获取用户加入的粉丝圈
        static let getFandomInfo = "/fandomAction/getFandomInfo" // 粉丝圈主页信息
        static let getRecentActions = "/fandomAction/getRecentActions" // 获取某明星粉丝圈的最新动态
    }
}
