//
//  MineViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/1.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SDWebImage

class MineViewController: UIViewController {
    var mySelfInfo: MySelf!
    let mineCardTableView = MineTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mineCardTableView.delegate = self
        mineCardTableView.dataSource = self
        mineCardTableView.setView()
        mineCardTableView.addView()
        view.addSubview(mineCardTableView)
        mineCardTableView.reloadData()
        loadData()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let backItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mineCardTableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    private func loadData() {
       // MyStorage.userID = "17"
        PublicParameter.requestTime = String.getDateNow()
        GetHelper.GetMyself(success: { mySelfInfo in
            self.mySelfInfo = mySelfInfo
            self.setMindCard()
            self.mineCardTableView.reloadData()
        }, failure:{ _ in
            print("还我info!")
        })
    }
    //- MARK: 人气值  动态数都没给
    private func setMindCard() {
        let card = mineCardTableView.userLabel.self
        card.userName.text = mySelfInfo.data?.username
        if let temo = mySelfInfo.data?.userID {
            card.id.text = "ID:" + String(temo)
        }else{
            card.id.text = "ID:"
        }
        
        if let temo = mySelfInfo.data?.monthRank {
            card.rankNum.text = String(temo)
        }else{
            card.rankNum.text = ""
        }
        if let temo = mySelfInfo.data?.followNum {
            card.attendContent.text = String(temo)
        }else{
            card.attendContent.text = ""
        }
        if let temo = mySelfInfo.data?.avatar {
            card.photo.sd_setImage(with: URL(string: temo), completed: .none)
        }else{
            card.photo = UIImageView()
        }
        if let temo = mySelfInfo.data?.fansNum {
            card.fansContent.text = String(temo)
        }else{
            card.fansContent.text = ""
        }
    }
    
}


extension MineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont.flexibleSystemFont(ofSize: 20)
        cell.textLabel?.textColor = UIColor(hex6: 0x333333)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "人气累积及历史排名"
        case 1:
            cell.textLabel?.text = "我的消息"
        case 2:
            cell.textLabel?.text = "我的收藏"
        case 3:
            cell.textLabel?.text = "粉丝圈"
        case 4:
            cell.textLabel?.text = "商务圈"
        default:
            cell.textLabel?.text = "设置"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 13
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0: self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
//            
//        default:
//            <#code#>
//        }
        switch indexPath.row {
        case 0:
            print("人气累积及历史排名被点击了")
        case 1:
            print("我的消息被点击了")
        case 2:
            print("我的收藏被点击了")
        case 3:
            print("粉丝圈被点击了")
            let fansFirstVC = FansCircleFirstViewController()
            fansFirstVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(fansFirstVC, animated: true)
        case 4:
            print("商务圈被点击了")
        case 5:
            print("设置被点击了")
        default:
            print("default")
        }
    }
    
}

