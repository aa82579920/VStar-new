//
//  FansCircleMainController.swift
//  V-Star
//
//  Created by 王春杉 on 2019/10/10.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import WMPageController
import SnapKit
import Alamofire
import SwiftyJSON
// 具体粉丝圈主页

struct FansCircleMainControllerScrollView{
    static var scrollView: UIScrollView?
    static var firstTableView: UITableView?
    static var secondTableView: UITableView?
}

struct HostUserID {
    static var id: Int?
    static var headImageUrl: String?
}
class FansCircleMainController: UIViewController {
    var topView: FansCircleTopView!
    var mainScrollView: UIScrollView!
    var contentView: UIView!
    var pageController: WMPageController!
    var barImageView: UIView!
    var fandomInfo = FandomInfo() // 头部信息
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setMainScrollView()
        getInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNavigationBar()
        FansCircleMainControllerScrollView.firstTableView?.isScrollEnabled = false
    }
    
    func getInfo() {
        let url = VStar_URL.baseURL + VStar_URL.fanCircle.getFandomInfo
        Alamofire.request(url, parameters: ["host_user_ID": HostUserID.id, "user_ID": MyStorage.userID]).responseJSON { response in
            switch response.result.isSuccess {
            case true:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    self.fandomInfo.fandom_user_num = json["data"]["fandom_user_num"].int!
                    self.fandomInfo.fans_num = json["data"]["fans_num"].int!
                    self.fandomInfo.host_username = json["data"]["host_username"].string!
                    self.fandomInfo.is_into = json["data"]["is_into"].bool!
                    self.fandomInfo.month_rank = json["data"]["month_rank"].int!
                    self.fandomInfo.total_fandom_action_num = json["data"]["total_fandom_action_num"].int!
                    self.fandomInfo.total_hot = json["data"]["total_hot"].string
                    self.fandomInfo.total_work_num = json["data"]["total_work_num"].int!
                    
                    self.setHeadView()
                    self.setPageView()
                    
                }
            case false:
                print(response.result.error)
            }
        }
        
        
    }
    // MARK: -设置导航栏
    func setNavigationBar() {
        // 设置导航栏title的颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let leftButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self
            , action: #selector(back))
        leftButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftButton
        
        self.view.backgroundColor = UIColor.gray
        
        let backItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
    // MARK: -初始化主ScrollView
    func setMainScrollView() {
        mainScrollView = UIScrollView(frame: self.view.frame)
        mainScrollView?.contentSize = CGSize(width: Device.width, height: Device.height*2)
        mainScrollView?.backgroundColor = .gray
        mainScrollView?.delegate = self
        // 当存在导航栏时，scrollview自动下移的问题解决
        mainScrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(mainScrollView!)
        
        FansCircleMainControllerScrollView.scrollView = mainScrollView
    }
    // MARK: -初始化头部视图
    func setHeadView() {
        topView = FansCircleTopView(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 300))
        topView.headImageView.sd_setImage(with: URL(string: HostUserID.headImageUrl!))
        topView.nickNameLable.text = fandomInfo.host_username
        topView.yueDuNumLable.text = fandomInfo.total_hot
        topView.fenSiNumLable.text = "\(fandomInfo.fans_num)"
        topView.paiMingNumLable.text = "\(fandomInfo.month_rank)"
        topView.tieZiNumLable.text = "\(fandomInfo.total_work_num)"
        self.mainScrollView.addSubview(topView)
    }
    // MARK: -初始化PageView
    func setPageView() {
        contentView = UIView()
        self.mainScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.width.height.equalTo(mainScrollView)
            make.top.equalTo(topView.snp.bottom)
            make.left.equalTo(0)
        }
        contentView.backgroundColor = .red
        
        pageController = WMPageController.init(viewControllerClasses: [CircleDongTaiController.self, CircleDongTaiController.self], andTheirTitles: ["圈子动态", "明星帖子"])
        pageController!.menuViewStyle = .line
        pageController!.menuItemWidth = Device.width/3  // 每个 MenuItem 的宽度
        pageController!.menuHeight = 60            // 导航栏高度
        //                pageController!.postNotification = true
        //                pageController!.bounces = true
        pageController!.titleSizeSelected = 16    // 选中时的标题尺寸
        pageController!.titleSizeNormal = 15      // 非选中时的标题尺寸
        pageController!.titleColorSelected = UIColor.white    //标题选中时的颜色, 颜色是可动画的
        pageController!.titleColorNormal = UIColor.white    //标题非选择时的颜色, 颜色是可动画的
        pageController!.menuBGColor = UIColor.starRed        //导航栏背景色
        pageController?.viewFrame = CGRect(x: 0, y: 0, width: Device.width, height: Device.height-64)
        self.mainScrollView?.addSubview(contentView!)
        contentView?.addSubview(self.pageController!.view)
        
        
    }
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
extension FansCircleMainController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let naviigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let topNewsViewBottom = CGPoint(x: (topView?.frame.minX)!, y: (topView?.frame.maxY)! - naviigationBarHeight - statusBarHeight)
        let offSetY = scrollView.contentOffset.y
        // 锁定滚动
        if scrollView == self.mainScrollView {
            FansCircleMainControllerScrollView.firstTableView?.isScrollEnabled = false
            if offSetY < 0 {
                scrollView.contentOffset = CGPoint(x: 0, y: 0)
            }else if offSetY < topNewsViewBottom.y - 20{
                self.navigationController?.navigationBar.subviews[0].alpha = 0
                self.title = ""
            }else if offSetY >= topNewsViewBottom.y - 20 && offSetY < topNewsViewBottom.y {
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: .starRed), for: .default)
                self.title = "xxxx"
                var alpha = offSetY / topNewsViewBottom.y
                if alpha >= 1 {
                    alpha = 1
                }
                //将透明度赋值给第一个View即可
                self.navigationController?.navigationBar.subviews[0].alpha = alpha
                FansCircleMainControllerScrollView.firstTableView?.isScrollEnabled = true
            }else if offSetY >= topNewsViewBottom.y {
                self.navigationController?.navigationBar.subviews[0].alpha = 1
                scrollView.contentOffset = topNewsViewBottom
                FansCircleMainControllerScrollView.firstTableView?.isScrollEnabled = true
            }
            
            
        }
        if FansCircleMainControllerScrollView.firstTableView?.contentOffset == CGPoint(x: 0, y: 0) {
            scrollView.isScrollEnabled = true
            
        }
    }
}
extension FansCircleMainController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
