//
//  AccountSettingViewController.swift
//  V-Star
//
//  Created by 王申宇 on 04/04/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SDWebImage

class AccountSettingViewController: UIViewController {
    var tableview: UITableView!
    var cellNames: Dictionary<Int, [String]>?
    private var currentDateCom: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
    var myself: MySelf!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableview.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        loadData()
    }
    
    func loadData() {
        GetHelper.GetMyself(success: { myself in
            self.myself = myself
            self.tableview.reloadData()
        }) { _ in
        }
    }
    
    func initView() {
        tableview = UITableView(frame: .zero, style: .grouped)
        self.cellNames = [
            0: [String](["头像"]),
            1: [String]([
                "名称",
                "个性签名",
                "地区",
                "性别",
                "生日"]),
            2: [String](["标签"])
        ]
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}

extension AccountSettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = cellNames?[section]
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let labelL = UILabel()
        labelL.text = cellNames?[indexPath.section]?[indexPath.row]
        cell.contentView.addSubview(labelL)
        labelL.snp.makeConstraints { make in
            make.centerY.equalTo(cell.contentView)
            make.left.equalTo(cell.contentView).offset(33)
        }
        let labelR = UILabel()
        labelR.textColor = .darkGray
        labelR.textAlignment = .right
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                labelR.text = Account.name
            case 1:
                labelR.text = Account.sign
            case 2:
                labelR.text = Account.address
            case 3:
                labelR.text = Account.sex
            case 4:
                labelR.text = Account.birth
            default:
                break
            }
        }
        if self.myself != nil {
            switch indexPath.section {
            case 0:
                let tempImg = UIImageView()
                tempImg.sd_setImage(with: URL(string: (self.myself.data?.avatar)!), completed: nil)
                tempImg.layer.cornerRadius = 20
                cell.contentView.addSubview(tempImg)
                tempImg.snp.makeConstraints { make in
                    make.centerY.equalTo(cell.contentView)
                    make.right.equalTo(cell.contentView).inset(10)
                    make.width.height.equalTo(40)
                }
            case 1:
                switch indexPath.row {
                case 0:
                    labelR.text = self.myself.data?.username
                case 1:
                    labelR.text = self.myself.data?.signature
                case 2:
                    labelR.text = self.myself.data?.city
                case 3:
                    labelR.text = self.myself.data?.sex
                default:
                    let birth = self.myself.data?.birthday
                    labelR.text = "\(birth?.year)-\(birth?.month)-\(birth?.day)"
                }
            default:
                labelR.text = self.myself.data?.tags
            }
        }
        cell.contentView.addSubview(labelR)
        labelR.snp.makeConstraints { make in
            make.left.equalTo(labelL.snp.right).offset(19)
            make.centerY.equalTo(cell.contentView)
            make.right.equalTo(cell.contentView).inset(10)
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                let input = InputViewController()
                input.type = 0
                navigationController?.pushViewController(input, animated: true)
            case 1:
                let input = InputViewController()
                input.type = 1
                navigationController?.pushViewController(input, animated: true)
            case 2:
                let input = InputViewController()
                input.type = 2
                navigationController?.pushViewController(input, animated: true)
            case 3:
                let input = InputViewController()
                input.type = 3
                navigationController?.pushViewController(input, animated: true)
            case 4:
                let dataPicker = TNDatePicker()
                self.definesPresentationContext = true
                /// 回调显示方法
                dataPicker.backDate = { [weak self] date in
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "YYYY-MM-dd"
                    let dateString: String = dateFormatter.string(from: date)
                    Account.birth = dateString
                    self!.tableview.reloadData()
                }
                dataPicker.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
                dataPicker.picker.reloadAllComponents()
                /// 弹出时日期滚动到当前日期效果
                self.present(dataPicker, animated: true) {
                    dataPicker.picker.selectRow(0, inComponent: 0, animated: true)
                    dataPicker.picker.selectRow((self.currentDateCom.month!) - 1, inComponent: 1, animated:   true)
                    dataPicker.picker.selectRow((self.currentDateCom.day!) - 1, inComponent: 2, animated: true)
                }
            default:
                break
            }
        }
        self.tableview.reloadData()
    }
}
