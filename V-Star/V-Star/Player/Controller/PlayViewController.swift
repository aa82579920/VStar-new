//
//  PlayViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/12.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import AVKit

struct VideoNum {
    static var num = 0
}

class PlayViewController: UIViewController {
    var playerView: AVPlayerView!
    var authorView: AvatarView!
    var rightView: PlayerRightView!
    var videoInfo: VideoInfo!
    var playUrl: String!
    var backBtn: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 17 / 255, green: 17 / 255, blue: 17 / 255, alpha: 1.0)
        loadData()
    }
    
    func initPlayer(frame: CGRect) {
        playerView = AVPlayerView(frame: frame)
        view.addSubview(playerView)
    }
    
    func initSubview() {
        authorView = AvatarView()
        authorView.addView()
        view.addSubview(authorView)
        authorView.snp.makeConstraints { make in
            make.right.equalTo(view).inset(20)
            make.top.equalTo(view).offset(50)
            make.width.equalTo(170)
            make.height.equalTo(44)
        }
        
        rightView = PlayerRightView()
        view.addSubview(rightView)
        rightView.snp.makeConstraints { make in
            make.bottom.equalTo(view).inset(30)
            make.right.equalTo(view).inset(20)
            make.height.equalTo(248)
            make.width.equalTo(50)
        }
        
        backBtn = UIButton()
        backBtn.setImage(UIImage(named: "back_white"), for: .normal)
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(view).offset(50)
            make.width.height.equalTo(40)
        }
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
        playerView.pause()
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadData() {
        GetHelper.GetVideoInfo(success: { videoInfo in
            self.videoInfo = videoInfo
            let data = videoInfo.data?.playInfoList?.playInfo![0]
            self.playUrl = data?.playURL
            let height = data?.height
            let width = data?.width
            let realHeight = (Screen.width / CGFloat(width!)) * CGFloat(height!)
            self.initPlayer(frame: CGRect(origin: CGPoint(x: 0, y: Screen.height / 2 - CGFloat(realHeight / 2)), size: CGSize(width: Screen.width, height: realHeight)))
            self.playerView.setPlayerSourceUrl(url: self.playUrl)
            self.initSubview()
            self.setNums()
        }) { _ in
            print("视频找不到了")
        }
    }
    
    func setNums() {
        let data = RWork.recommendWork.data[VideoNum.num]
        rightView.collectNum.text = String(data.collectionNum!)
        rightView.commitNum.text = String(data.commentNum!)
        rightView.likeNum.text = String(data.hotValue!)
    }
    
    
}
