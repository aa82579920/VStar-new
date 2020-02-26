//
//  Tools.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/1.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
struct Device {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}
extension UIColor {
    /**
     The six-digit hexadecimal representation of color of the form #RRGGBB.
     
     - parameter hex6: Six-digit hexadecimal value.
     */
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        // TODO: below
        // Store Hex converted UIColours (R, G, B, A) to a persistent file (.plist)
        // And when initializing the app, read from the plist into the memory as a static struct (Metadata.Color)
        let divisor = CGFloat(255)
        let r = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let g = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let b = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    static var starRed = UIColor(red: 224 / 255, green: 9 / 51, blue: 78 / 255, alpha: 1)
    
    static var starGray = UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)
}

extension UIView {
    
    var x: CGFloat {
        set(newValue) {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    
    var y: CGFloat {
        set(newValue) {
            frame.origin.y = newValue
        }
        get {
            return frame.origin.y
        }
    }
    
    var height: CGFloat {
        set(newValue) {
            frame.size.height = newValue
        }
        get {
            return frame.size.height
        }
    }
    
    var width: CGFloat {
        set(newValue) {
            frame.size.width = newValue
        }
        get {
            return frame.size.width
        }
    }
}

extension UIFont {
    static func flexibleSystemFont(ofSize size: CGFloat) -> UIFont {
        var size = size
        if UIDevice.current.model != "iPad" {
            size = (UIScreen.main.bounds.size.width / 375.0) * size
        }
        return UIFont.systemFont(ofSize: size)
    }
    
    static func flexibleSystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        var size = size
        if UIDevice.current.model != "iPad" {
            size = (UIScreen.main.bounds.size.width / 375.0) * size
        }
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}

extension String {
    static func noSpace(_ str: String) -> String {
        return str.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    //md5加密
    static func md5(str:String) -> String{
        let cStr = str.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    //按所需格式获取时间
    static func getDateNow() -> String {
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "YYYY-MM-dd-HH-mm-ss"// 自定义时间格式
        
        return dateformatter.string(from: Date())
    }
    
    static func format(decimal:Float, _ maximumDigits:Int = 1, _ minimumDigits:Int = 1) ->String? {
        let number = NSNumber(value: decimal)
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = maximumDigits //设置小数点后最多2位
        numberFormatter.minimumFractionDigits = minimumDigits //设置小数点后最少2位（不足补0）
        return numberFormatter.string(from: number)
    }
    
    func urlScheme(scheme:String) -> URL? {
        if let url = URL.init(string: self) {
            var components = URLComponents.init(url: url, resolvingAgainstBaseURL: false)
            components?.scheme = scheme
            return components?.url
        }
        return nil
    }
    
    static func LocalizedString(_ key: Any, _ comment: Any?) -> String{
        return Foundation.NSLocalizedString(key as! String, tableName: "", bundle: .main, value: key as! String, comment: comment as! String)
    }
    
    public func localString() -> String {
        return .LocalizedString(self, nil)
    }
}

extension UIImage {
    /// Adaptive Height with Given Width
    ///
    /// - Parameters:
    ///   - image: which you will use
    ///   - newWidth: which you like
    /// - Returns: the nice image
    static func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
extension UIImage {
    //pure color image
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
extension UIViewController {
    // 获取当前的 UIViewController
    class func current(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return current(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return current(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return current(base: presented)
        }
        return base
    }
}

//MARK: 屏幕宽高
struct Screen {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

extension CGRect {
    static func evenRect(rect: CGRect) -> CGRect {
        return CGRect(x: Int(rect.origin.x) / 2 * 2, y: Int(rect.origin.y) / 2 * 2, width: Int(rect.size.width) / 2 * 2, height: Int(rect.size.height) / 2 * 2)
    }
}
