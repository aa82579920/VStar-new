//
//  VStarPostHelper.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct PostHelper {
    static func PostSignUp(success: @escaping (SignUpModel) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["username": MyStorage.username, "password": MyStorage.password] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.user.register, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let signupmdl = try? SignUpModel(data: data) {
                success(signupmdl)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostLogin(success: @escaping (Login) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["username": MyStorage.username, "password": MyStorage.password] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.user.login, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let login = try? Login(data: data) {
                success(login)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostUpdate(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID, "avatar": MyStorage.avatar, "city_Name": MyStorage.cityName, "sex": MyStorage.sex, "age": MyStorage.age, "signature": MyStorage.signature, "tags": MyStorage.tags] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.user.update, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let update = try? IsError(data: data) {
                success(update)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostCommentInsex(success: @escaping (CommentIndex) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "page": MyStorage.page, "work_ID": WorkStorage.workId] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.comment.index, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let index = try? CommentIndex(data: data) {
                success(index)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostCommentCreate(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        //error_code = -1成功
        //---------- = 1 失败
        var myParam = ["work_ID": WorkStorage.workId, "user_ID": MyStorage.userID, "content": WorkStorage.commentContent] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.comment.create, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let create = try? IsError(data: data) {
                success(create)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostCommentDelete(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        //error_code = 2 不是你的评论
        //---------- = 1 删除失败
        //---------- = -1 成功
        var myParam = ["comment_ID": WorkStorage.commentId, "user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.comment.delete, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let delete = try? IsError(data: data) {
                success(delete)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostCommentUpdate(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        //error_code = 2 不是你的评论
        //---------- = 1 修改失败
        //---------- = -1 成功
        var myParam = ["comment_ID": WorkStorage.commentId, "user_ID": MyStorage.userID, "content": WorkStorage.commentContent] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.comment.update, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let commentUpdate = try? IsError(data: data) {
                success(commentUpdate)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostCommentGetCC(success: @escaping (CommentGetCC) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["comment_ID": WorkStorage.commentId, "limit": MyStorage.limit, "page": MyStorage.page] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.comment.getCC, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let getCC = try? CommentGetCC(data: data) {
                success(getCC)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostCommentCreateCC(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        //-1 成功
        // 1 失败
        var myParam = ["comment_ID": WorkStorage.commentId, "user_ID": MyStorage.userID, "content": WorkStorage.commentContent] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.comment.createCC, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let createCC = try? IsError(data: data) {
                success(createCC)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostCommentDeleteCC(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        //error_code = 2 不是你的评论
        //---------- = 1 删除失败
        //---------- = -1 成功
        var myParam = ["ccID": WorkStorage.ccID, "user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.comment.deleteCC, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let deleteCC = try? IsError(data: data) {
                success(deleteCC)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostCommentUpdateCC(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        //error_code = 2 不是你的评论
        //---------- = 1 修改失败
        //---------- = -1 成功
        var myParam = ["ccID": WorkStorage.ccID, "user_ID": MyStorage.userID, "content": WorkStorage.commentContent] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.comment.updateCC, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let updateCC = try? IsError(data: data) {
                success(updateCC)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostFollowAdd(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["from_user_ID": MyStorage.userID, "to_user_ID": WorkStorage.toUserID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.follow.add, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let add = try? IsError(data: data) {
                success(add)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostFollowDelete(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["from_user_ID": MyStorage.userID, "to_user_ID": WorkStorage.toUserID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.follow.delete, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let delete = try? IsError(data: data) {
                success(delete)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostSendActionComment(success: @escaping (IsErrorWithoutData) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": WorkStorage.userID, "ac_content": WorkStorage.acContent, "be_at_user_ID": WorkStorage.beAtUserID, "action_ID": WorkStorage.actionID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.action.sendActionComment, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let send = try? IsErrorWithoutData(data: data) {
                success(send)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostdeleteActionComment(success: @escaping (IsErrorWithoutData) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["acID": WorkStorage.acID, "user_ID": WorkStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.action.deleteActionComment, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let delete = try? IsErrorWithoutData(data: data) {
                success(delete)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostSendActionCommentComment(success: @escaping (IsErrorWithoutData) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": WorkStorage.userID, "acc_content": WorkStorage.accContent, "be_at_user_ID": WorkStorage.beAtUserID, "acID": WorkStorage.acID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.action.sendActionCommentComment, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let sendCC = try? IsErrorWithoutData(data: data) {
                success(sendCC)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostDeleteActionCommentComment(success: @escaping (IsErrorWithoutData) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["accID": WorkStorage.accID ,"user_ID": WorkStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.action.daleteActionCommentComment, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let deleteCC = try? IsErrorWithoutData(data: data) {
                success(deleteCC)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostUpdataActionImage(success: @escaping (UploadActionImage) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["ext": WorkStorage.ext] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.action.updateActionImage, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let updataAI = try? UploadActionImage(data: data) {
                success(updataAI)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostSendNewAction(success: @escaping (IsErrorWithoutData) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": WorkStorage.userID, "content": WorkStorage.actionContent, "img_IDs": WorkStorage.imgIDs, "be_at_user_ID": WorkStorage.beAtUserID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.action.sendNewAction, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let sendNewAction = try? IsErrorWithoutData(data: data) {
                success(sendNewAction)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostSendMessage(success: @escaping (IsErrorWithoutData) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["from": MyStorage.userID, "to": WorkStorage.toUserID, "content": WorkStorage.messageContent] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.message.sendMessage, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let sendNewAction = try? IsErrorWithoutData(data: data) {
                success(sendNewAction)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostMessageByUserID(success: @escaping (MessageByUserID) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID, "model": WorkStorage.model, "limit": MyStorage.limit, "page": MyStorage.page] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.message.getMessageByUserID, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let message = try? MessageByUserID(data: data) {
                success(message)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostMessageByID(success: @escaping (MessageByID) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["message_ID": WorkStorage.messageID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.message.getMessageByID, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let message = try? MessageByID(data: data) {
                success(message)
            }
        }, failure: { _ in
            
        })
    }
    
    static func PostSetMessageRead(success: @escaping (IsErrorWithoutData) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["message_ID": WorkStorage.messageID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.message.setMessageRead, myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let message = try? IsErrorWithoutData(data: data) {
                success(message)
            }
        }, failure: { _ in
            
        })
    }
}

