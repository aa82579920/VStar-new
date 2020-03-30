//
//  PlayerRightView.swift
//  V-Star
//
//  Created by 王申宇 on 19/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class PlayerRightView: UIView {
    var likeBtn = UIButton()
    var likeNum = UILabel()
    var share = UIButton()
    var shareNum = UILabel()
    var collect = UIButton()
    var collectNum = UILabel()
    var commit = UIButton()
    var commitNum = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        addView()
    }
    
    func initView() {
        self.backgroundColor = nil
        likeBtn.setImage(UIImage(named: "dianZan_normal"), for: .normal)
        likeBtn.addTarget(self, action: #selector(likeIt), for: .touchUpInside)
        
        likeNum.textColor = UIColor(hex6: 0xcccccc)
        likeNum.textAlignment = .center
        likeNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        
        share.setImage(UIImage(named: "share_normal"), for: .normal)
        share.setImage(UIImage(named: "share_highlighting"), for: .highlighted)
        share.addTarget(self, action: #selector(toShare), for: .touchUpInside)
        
        shareNum.textColor = UIColor(hex6: 0xcccccc)
        shareNum.textAlignment = .center
        shareNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        
        collect.setImage(UIImage(named: "collect_normal"), for: .normal)
        collect.setImage(UIImage(named: "collect_highlighting"), for: .highlighted)
        collect.addTarget(self, action: #selector(toCollect), for: .touchUpInside)
        
        collectNum.textColor = UIColor(hex6: 0xcccccc)
        collectNum.textAlignment = .center
        collectNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        
        commit.setImage(UIImage(named: "commit_normal"), for: .normal)
        commit.addTarget(self, action: #selector(toCommit), for: .touchUpInside)
        
        commitNum.textColor = UIColor(hex6: 0xcccccc)
        commitNum.textAlignment = .center
        commitNum.font = UIFont.flexibleSystemFont(ofSize: 12)
    }
    
    func addView() {
        self.addSubview(likeBtn)
        self.addSubview(likeNum)
        self.addSubview(share)
        self.addSubview(shareNum)
        self.addSubview(collect)
        self.addSubview(collectNum)
        self.addSubview(commit)
        self.addSubview(commitNum)
        
        likeBtn.snp.makeConstraints { make in
            make.right.equalTo(self).inset(10)
            make.top.equalTo(self)
            make.width.height.equalTo(40)
        }
        
        likeNum.snp.makeConstraints { make in
            make.right.equalTo(self)
            make.top.equalTo(likeBtn.snp.bottom).offset(6)
        }
        
        share.snp.makeConstraints { make in
            make.right.equalTo(likeBtn)
            make.top.equalTo(likeNum.snp.bottom).offset(20)
            make.width.height.equalTo(40)
        }
        
        shareNum.snp.makeConstraints { make in
            make.right.equalTo(likeBtn)
            make.top.equalTo(share.snp.bottom).offset(6)
        }
        
        collect.snp.makeConstraints { make in
            make.right.equalTo(likeBtn)
            make.top.equalTo(shareNum.snp.bottom).offset(20)
            make.width.height.equalTo(40)
        }
        
        collectNum.snp.makeConstraints { make in
            make.right.equalTo(likeBtn)
            make.top.equalTo(collect.snp.bottom).offset(6)
        }
        
        commit.snp.makeConstraints { make in
            make.right.equalTo(likeBtn)
            make.top.equalTo(collectNum.snp.bottom).offset(20)
            make.width.height.equalTo(40)
        }
        
        commitNum.snp.makeConstraints { make in
            make.right.equalTo(likeBtn)
            make.top.equalTo(commit.snp.bottom).offset(6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlayerRightView {
    @objc func likeIt() {
        
    }
    
    @objc func toShare() {
        
    }
    
    @objc func toCollect() {
        
    }
    
    @objc func toCommit() {
        
    }
}
