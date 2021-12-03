//
//  UIColorExtension.swift
//  YMSDK
//
//  Created by retail on 2021/7/1.
//

import UIKit

extension Int {
    fileprivate func colorValue() -> UIColor {
        let red   =  Double((self & 0xFF0000) >> 16) / 255.0
        let green =  Double((self & 0xFF00)   >> 8 ) / 255.0
        let blue  =  Double( self & 0xFF   ) / 255.0
        return UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
}
extension String {
    fileprivate func colorValue()->UIColor {
        var cstr = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() as NSString
        if cstr.length < 6 { return .clear }
        if cstr.hasPrefix("0X") {
            cstr = cstr.substring(from: 2) as NSString
        } else if cstr.hasPrefix("#") {
            cstr = cstr.substring(from: 1) as NSString
        }
        if cstr.length != 6 && cstr.length != 8 { return .clear }
        var range = NSRange.init()
        range.location = 0
        range.length = 2
        //r
        let rStr = cstr.substring(with: range);
        //g
        range.location = 2
        let gStr = cstr.substring(with: range)
        //b
        range.location = 4
        let bStr = cstr.substring(with: range)
        //a
        range.location = 6
        var aStr = "FF"
        if cstr.length > range.location {
            aStr = cstr.substring(with: range)
        }
        var r :UInt32 = 0x0
        var g :UInt32 = 0x0
        var b :UInt32 = 0x0
        var a :UInt32 = 0x0
        Scanner.init(string: rStr).scanHexInt32(&r)
        Scanner.init(string: gStr).scanHexInt32(&g)
        Scanner.init(string: bStr).scanHexInt32(&b)
        Scanner.init(string: aStr).scanHexInt32(&a)
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
    }
}
extension UIColor {
    @discardableResult
    static func color(_ hex: String)->UIColor {
        return hex.colorValue()
    }
    @discardableResult
    static func color(_ val: Int) -> UIColor {
        return val.colorValue()
    }
}
