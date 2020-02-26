//
//  InputICodeView.swift
//  V-Star
//
//  Created by 王申宇 on 15/01/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SnapKit

class InputICodeView: UIView {
    var inputFrame: UIView!
    var prompt: UILabel!
    var textField: UITextField!
    var confirmBtn: UIButton!
    
    //保存上一次的文本内容
    var previousText:String!
     
    //保持上一次的文本范围
    var previousRange:UITextRange!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        self.backgroundColor = UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1.0)
        //邀请码框
        inputFrame = UIView()
        inputFrame.backgroundColor = .white
        inputFrame.layer.cornerRadius = 12
        //提示词
        prompt = UILabel()
        prompt.backgroundColor = .white
        prompt.textColor = UIColor(hex6: 0x999999)
        prompt.font = UIFont.flexibleSystemFont(ofSize: 16)
        prompt.textAlignment = .left
        prompt.text = "请输入邀请码"
        //输入框
        textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = UIColor(hex6: 0x333333)
        textField.font = UIFont.flexibleSystemFont(ofSize: 60)
        textField.delegate = self
        textField.addTarget(self, action: #selector(iCodeInput(_:)), for: .editingChanged)
        //确认键
        confirmBtn = UIButton()
        confirmBtn.backgroundColor = UIColor.orange
        confirmBtn.layer.cornerRadius = 20
        confirmBtn.setTitle("确认", for: .normal)
        confirmBtn.titleLabel?.textColor = .white
    }
    
    @objc func iCodeInput(_ textField: UITextField) {
        //当前光标的位置（后面会对其做修改）
        var cursorPostion = textField.offset(from: textField.beginningOfDocument,to: textField.selectedTextRange!.start)
        
        //将小写字母转化为大写字母
        let capital = getCapital(string: textField.text!)
        
        //添加空格
        let space = getSpace(capital, &cursorPostion)
        
        textField.text = space
         
        //让光标停留在正确位置
        let targetPostion = textField.position(from: textField.beginningOfDocument,offset: cursorPostion)!
        textField.selectedTextRange = textField.textRange(from: targetPostion,to: targetPostion)
    }
    //得到只含大写字母的字符串
    func getCapital(string: String) -> String {
        return string.uppercased()
    }
    
    func getSpace(_ str: String,_ cursorPosition:inout Int) -> String {
        //处理后的结果字符串
        var result = ""
        if str.count < 12 {
            result.append(str)
            result.append(" ")
            cursorPosition = cursorPosition + 1
        }
        return result
    }
    func addView() {
        self.addSubview(inputFrame)
        inputFrame.snp.makeConstraints { make in
            make.top.equalTo(self).offset(300)
            make.left.right.equalTo(self).inset(15)
            make.width.equalTo(330)
            make.height.equalTo(178)
        }
        
        inputFrame.addSubview(prompt)
        prompt.snp.makeConstraints { make in
            make.top.equalTo(inputFrame).offset(20)
            make.left.equalTo(inputFrame).offset(20)
            make.width.equalTo(140)
            make.height.equalTo(30)
        }
        
        inputFrame.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(prompt.snp.bottom).offset(20)
            make.height.equalTo(80)
            make.width.equalTo(300)
            make.bottom.equalTo(inputFrame.snp.bottom).inset(50)
            make.left.equalTo(inputFrame).offset(24)
        }
        
        self.addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.top.equalTo(inputFrame.snp.bottom).offset(27)
            make.left.right.equalTo(inputFrame)
            make.height.equalTo(40)
        }
    }
}

extension InputICodeView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count == 0 {return true}
        if textField.text!.count > 11 {return false}
        //先保存输入框原先的值和选中范围
        self.previousText = textField.text!
        self.previousRange = textField.selectedTextRange!
        if self.previousText.count > 11 {
        //            textField.text = String(finalText.prefix(5))
            return false
        }
        return true
    }
}
