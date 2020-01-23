//
//  TaskViewController.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    
    var titleView: UIView!
    var titleLabel: UILabel!
    var backBtn: UIButton!
    var withdrawBtn: UIButton!
    var invitationTxt: String!
    var myself: MySelf!
    var weekInfo: WeekInfo!
    var redCard: RedCard!
    var taskTableView: TaskTableView!
//    var inpustICodeView: InputICodeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .starRed
        navigationItem.title = "我的红包"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提现", style: .done, target: self, action: #selector(getIt))
        view.backgroundColor = .white
        loadData()
        redCard = RedCard()
        view.addSubview(redCard)
        redCard.snp.makeConstraints { make in
            make.top.equalTo((self.navigationController?.navigationBar.frame.height)! + 50)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).inset(30)
//            make.height.equalTo(171)
        }
        taskTableView = TaskTableView()
        view.addSubview(taskTableView)
        taskTableView.snp.makeConstraints { make in
            make.top.equalTo(redCard.snp.bottom).offset(20)
            make.bottom.equalTo(view.snp.bottom)
            make.left.right.equalTo(view)
        }
    }
    @objc func getIt() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        let inputCodeView = InputICodeView()
        if UserDefaults.standard.bool(forKey: "firstLaunch") {
            view.addSubview(inputCodeView)
            inputCodeView.snp.makeConstraints { make in
                make.edges.equalTo(view)
            }
            UserDefaults.standard.set(false, forKey: "firstLauch")
        }else{
            
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    private func loadData() {
        TaskHelper.getInvitationCode(success: { invitationCode in
            self.invitationTxt = invitationCode.data?.invitationCode!
        }) { _ in
            print("error: getInvitationCode")
        }
        GetHelper.GetMyself(success: { myself in
            self.myself = myself
        }) { _ in
            print("error: userinfo can't get ")
        }
        TaskHelper.getWeekInfo(success: { weekInfo in
            self.weekInfo = weekInfo
            self.redCard.weekInfo = weekInfo
            self.taskTableView.weekInfo = weekInfo
        }) { _ in
            print("error")
        }
    }
    
    func initNavigation() {
        titleView = UIView()
        titleLabel = UILabel()
        backBtn = UIButton()
        withdrawBtn = UIButton()
        
        withdrawBtn.addTarget(self, action: #selector(withdraw), for: .touchUpInside)
    }
    
    @objc func withdraw() {
        
    }
}

extension TaskViewController {
    
}
