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
    let inputCodeView = InputICodeView()
    var money = 0

//    var inpustICodeView: InputICodeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .starRed
        navigationItem.title = "我的红包"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提现", style: .done, target: self, action: #selector(getIt))
        view.backgroundColor = .white
        redCard = RedCard()
        taskTableView = TaskTableView()
        taskTableView.getSignBtn.addTarget(self, action: #selector(toSignDay), for: .touchUpInside)
        taskTableView.getUploadBtn.addTarget(self, action: #selector(getUploadMoney), for: .touchUpInside)
        taskTableView.getWatchBtn.addTarget(self, action: #selector(getWathcMoney), for: .touchUpInside)
        view.addSubview(redCard)
        redCard.snp.makeConstraints { make in
            make.top.equalTo((self.navigationController?.navigationBar.frame.height)! + 50)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).inset(30)
            make.height.equalTo(183)
        }
        
        view.addSubview(taskTableView)
        taskTableView.snp.makeConstraints { make in
            make.top.equalTo(redCard.snp.bottom).offset(20)
            make.bottom.equalTo(view.snp.bottom)
            make.left.right.equalTo(view)
        }
        loadData()
    }
    @objc func getIt() {
        
    }
    
    func showTask(money: String) {
        let redPacket = RedPacket(money: money)
        redPacket.backgroundColor = UIColor(white: 0.5, alpha: 0.9)
        view.addSubview(redPacket)
        redPacket.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        inputCodeView.confirmBtn.addTarget(self, action: #selector(confirmInput), for: .touchUpInside)
        if UserDefaults.standard.bool(forKey: "firstTask") == false {
            view.addSubview(inputCodeView)
            inputCodeView.snp.makeConstraints { make in
                make.edges.equalTo(view)
            }
            UserDefaults.standard.set(true, forKey: "firstTask")
        }else{
            
        }
    }

    @objc func confirmInput() {
        TaskStorage.iCode = String.noSpace(self.inputCodeView.textField.text!)
        TaskHelper.UseICode(success: { _ in
            self.inputCodeView.removeFromSuperview()
        }) { _ in
            let errorLab = UILabel()
            errorLab.text = "邀请码不存在"
            errorLab.font = UIFont.flexibleSystemFont(ofSize: 16)
            errorLab.textColor = .red
            self.inputCodeView.inputFrame.addSubview(errorLab)
            errorLab.snp.makeConstraints { make in
                make.bottom.equalTo(self.inputCodeView.inputFrame)
                make.centerX.equalTo(self.inputCodeView.inputFrame)
                make.width.equalTo(210)
                make.top.equalTo(self.inputCodeView.textField.snp.bottom)
            }
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
        MyStorage.userID = 17
        TaskHelper.getWeekInfo(success: { weekInfo in
            self.weekInfo = weekInfo
            self.redCard.weekInfo = weekInfo
            self.taskTableView.weekInfo = weekInfo
            self.redCard.money.text = "¥\(weekInfo.data?.totalMoney ?? "\(self.money)")"
            self.money = Int(self.redCard.money.text ?? "0") ?? 0
            self.taskTableView.reloadData()
        }) { _ in
            print("error")
        }
    }
    
    func updateTaskStyle(weekInfo: WeekInfo) {
        
    }
    
    func initNavigation() {
        titleView = UIView()
        titleLabel = UILabel()
        backBtn = UIButton()
        withdrawBtn = UIButton()
        withdrawBtn.addTarget(self, action: #selector(toSignDay), for: .touchUpInside)
    }
    
    @objc func withdraw() {
        
    }
}

extension TaskViewController {
    @objc func toSignDay() {
        print("领取被点几了")
        //写alert
        MyStorage.userID = 17
        TaskHelper.signDay(success: { info in
            self.showTask(money: String((info.data?.thisTimeGetMoney)!))
            self.taskTableView.getSignBtn.isSelected = false
            self.redCard.money.text = "¥\(self.money + (info.data?.thisTimeGetMoney)!)"
            self.taskTableView.reloadData()

            print("success")
        }) { _ in
            print("fail")
        }
    }
    
    @objc func getUploadMoney() {
        TaskHelper.getUploadMoney(success: { info in
            self.showTask(money: String((info.data?.thisTimeGetMoney) ?? 0))
            self.taskTableView.getUploadBtn.isSelected = false
            self.redCard.money.text = "¥\(self.money + (info.data?.thisTimeGetMoney)!)"
            self.taskTableView.reloadData()
            print("success")
        }) { _ in
            print("fail")
        }
    }
    
    @objc func getWathcMoney() {
        TaskHelper.getWatchMoney(success: { info in
            self.showTask(money: String((info.data?.thisTimeGetMoney)!))
            self.taskTableView.getWatchBtn.isSelected = false
            self.redCard.money.text = "¥\(self.money + (info.data?.thisTimeGetMoney)!)"
            self.taskTableView.reloadData()
            print("success")
        }) { _ in
            print("fail")
        }
    }
}
