//
//  FontAwesome.swift
//  FontAwesome
//
//  Created by Reona Kubo on 2018/02/12.
//  Copyright © 2018年 Reona Kubo. All rights reserved.
//

import UIKit

public struct FontAwesomeConfig {
    
    private init(){}
    
    public static let fontAspectRatio:CGFloat = 1
}

public class FontAwesome: NSObject {
    
    public func icon(_ icon:Awesome,text:String,size:CGFloat) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeRegular, size: size)!
        let defaultFont = UIFont.systemFont(ofSize: size)
        let mutableAttributedString = NSMutableAttributedString()
        
        let icon = NSAttributedString(string:icon.rawValue , attributes: [
            // NSAttributedStringKey.font: UIFont.fontAwesome,
            NSAttributedStringKey.font: font
            ])
        let text = NSAttributedString(string:text,attributes: [
            NSAttributedStringKey.font: defaultFont
            ])
        mutableAttributedString.append(icon)
        mutableAttributedString.append(text)
        return mutableAttributedString
    }
    
    public func icon(text:String,icon:Awesome,size:CGFloat) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeRegular, size: size)!
        let defaultFont = UIFont.systemFont(ofSize: size)
        let mutableAttributedString = NSMutableAttributedString()
        
        let icon = NSAttributedString(string:icon.rawValue , attributes: [
            // NSAttributedStringKey.font: UIFont.fontAwesome,
            NSAttributedStringKey.font: font
            ])
        let text = NSAttributedString(string:text,attributes: [
            NSAttributedStringKey.font: defaultFont
            ])
        mutableAttributedString.append(text)
        mutableAttributedString.append(icon)
        return mutableAttributedString
    }
    
    public func icon(_ name:Awesome,size:CGFloat) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeRegular, size: size)!
        
        let attributedString = NSAttributedString(string:name.rawValue , attributes: [
            // NSAttributedStringKey.font: UIFont.fontAwesome,
            NSAttributedStringKey.font: font,
            ])
        return attributedString
    }
}

public extension UIImage {
    
    public static func fontAwesomeIcon(name: Awesome, textColor: UIColor, size: CGSize, backgroundColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) -> UIImage {
        
        // Prevent application crash when passing size where width or height is set equal to or less than zero, by clipping width and height to a minimum of 1 pixel.
        var size = size
        if size.width <= 0 { size.width = 1 }
        if size.height <= 0 { size.height = 1 }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        
        let fontSize = min(size.width / FontAwesomeConfig.fontAspectRatio, size.height)
        
        // stroke width expects a whole number percentage of the font size
        let strokeWidth: CGFloat = fontSize == 0 ? 0 : (-100 * borderWidth / fontSize)
        let font:UIFont = UIFont(name: FontNames.awesomeRegular, size: size.width)!
        
        let attributedString = NSAttributedString(string:name.rawValue , attributes: [
           // NSAttributedStringKey.font: UIFont.fontAwesome,
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor: textColor,
            NSAttributedStringKey.backgroundColor: backgroundColor,
            NSAttributedStringKey.paragraphStyle: paragraph,
            NSAttributedStringKey.strokeWidth: strokeWidth,
            NSAttributedStringKey.strokeColor: borderColor
            ])
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) / 2, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}



