//
//  String_Extension.swift
//  SwiftDemo
//
//  Created by 中行讯 on 2018/7/9.
//  Copyright © 2018年 Beijing CIC Technology Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

private func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, w: CGFloat, h: CGFloat) -> CGSize {
    if str != nil {
        let strSize = (str! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: font)], context: nil).size
        return strSize
    }
    
    if attriStr != nil {
        let strSize = attriStr!.boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, context: nil).size
        return strSize
    }
    
    return CGSize.zero
    
}

extension String {
    /// 获取字符串高度H
    ///
    /// - Parameters:
    ///   - str: 字符
    ///   - strFont: 字体
    ///   - w: 跨度
    /// - Returns: 返回高度
    func getNormalStrH(str: String, strFont: CGFloat, w: CGFloat) -> CGSize {
        return getNormalStrSize(str: str, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude)
    }

    
    /// 获取字符串宽
    ///
    /// - Parameters:
    ///   - str: 字符
    ///   - strFont: strFont description
    ///   - h: h description
    /// - Returns: return value description
    func getNormalStrW(str: String, strFont: CGFloat, h: CGFloat) -> CGSize {
        return getNormalStrSize(str: str, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h)
    }
    
    /// Description获取富文本字符串高度H
    ///
    /// - Parameters:
    ///   - attriStr: attriStr description
    ///   - strFont: strFont description
    ///   - w: w description
    /// - Returns: return value description
    func getAttributedStrH(attriStr: NSMutableAttributedString, strFont: CGFloat, w: CGFloat) -> CGFloat {
        return getNormalStrSize(attriStr: attriStr, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
    }
    
    /// 获取富文本字符串宽度W
    ///
    /// - Parameters:
    ///   - attriStr: attriStr description
    ///   - strFont: strFont description
    ///   - h: h description
    /// - Returns: return value description
    func getAttributedStrW(attriStr: NSMutableAttributedString, strFont: CGFloat, h: CGFloat) -> CGFloat {
        return getNormalStrSize(attriStr: attriStr, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
    }
}
