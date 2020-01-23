//
//  BTTagView.swift
//  V-Star
//
//  Created by 王申宇 on 17/01/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class BTTagView: UIView {
    private var tagBtn: [UIButton]!
    private var tagLbl: [UILabel]!
    var isBtn = true
    private var content = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tagBtn = [UIButton]()
        tagLbl = [UILabel]()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 设置标签内容
    /// - Parameter string: 内容
    func setContent(string: String) {
        self.content = string
    }
    
    /// 将字符串变成标签形式
    /// - Parameter string: 将内容用","隔开
    private func stringToTags(string: String) -> [UIView] {
        var contents = string.split(separator: ",")
        if isBtn {
            for c in contents {
                
            }
            return [UIButton]()
        }
        return [UILabel]()
    }
    
    /// 判断标签是否会被边框截断
    private func isSide() -> Bool{
        return true
    }
    
    /// 排列标签
    /// - Parameter tags: 标签
    private func toArrange(_ tags: [UIView]) {
        
    }
}
