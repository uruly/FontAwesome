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
    
    public static let fontAspectRatio:CGFloat = 1.28571429
    //public static let fontAspect
}

public class FontAwesome: NSObject {
    
    private func iconAwesome(_ icon:String,text:String,size:CGFloat,defaultFont:UIFont,color:UIColor = .black,font:UIFont) -> NSAttributedString {
        //let defaultFont = UIFont.systemFont(ofSize: size)
        let mutableAttributedString = NSMutableAttributedString()
        
        let icon = NSAttributedString(string:icon , attributes: [
            // NSAttributedStringKey.font: UIFont.fontAwesome,
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor:color
            ])
        let text = NSAttributedString(string:text,attributes: [
            NSAttributedStringKey.font: defaultFont,
            NSAttributedStringKey.foregroundColor:color
            ])
        mutableAttributedString.append(icon)
        mutableAttributedString.append(text)
        return mutableAttributedString
    }

    
    private func iconAwesome(text:String,icon:String,size:CGFloat,defaultFont:UIFont,color:UIColor = .black,font:UIFont) -> NSAttributedString {
        //let defaultFont = UIFont.systemFont(ofSize: size)
        let mutableAttributedString = NSMutableAttributedString()
        
        let icon = NSAttributedString(string:icon , attributes: [
            // NSAttributedStringKey.font: UIFont.fontAwesome,
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor:color
            ])
        let text = NSAttributedString(string:text,attributes: [
            // NSAttributedStringKey.font: UIFont.fontAwesome,
            NSAttributedStringKey.font: defaultFont,
            NSAttributedStringKey.foregroundColor:color
            ])
        mutableAttributedString.append(text)
        mutableAttributedString.append(icon)
        return mutableAttributedString
    }
    
    private func iconAwesome(_ name:String,size:CGFloat,color:UIColor,font:UIFont) -> NSAttributedString {
        
        let attributedString = NSAttributedString(string:name , attributes: [
            // NSAttributedStringKey.font: UIFont.fontAwesome,
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor:color
            ])
        return attributedString
    }
    
    public func icon(_ icon:Awesome,text:String,size:CGFloat,defaultFont:UIFont,color:UIColor = .black) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeRegular, size: defaultFont.pointSize)!
        return iconAwesome(icon.rawValue, text: text, size: size, defaultFont: defaultFont, color: color,font:font)
    }
    
    public func icon(_ icon:AwesomeSolid,text:String,size:CGFloat,defaultFont:UIFont,color:UIColor = .black) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeSolid, size: defaultFont.pointSize)!
        return iconAwesome(icon.rawValue, text: text, size: size, defaultFont: defaultFont, color: color,font:font)
    }
    
    public func icon(text:String,icon:Awesome,size:CGFloat,defaultFont:UIFont,color:UIColor = .black) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeRegular, size: defaultFont.pointSize)!
        return iconAwesome(text:text,icon:icon.rawValue,size:size,defaultFont:defaultFont,color:color,font:font)
    }
    
    public func icon(text:String,icon:AwesomeSolid,size:CGFloat,defaultFont:UIFont,color:UIColor = .black) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeSolid, size: defaultFont.pointSize)!
        return iconAwesome(text:text,icon:icon.rawValue,size:size,defaultFont:defaultFont,color:color,font:font)
    }
    
    public func icon(_ name:Awesome,size:CGFloat,color:UIColor = .black) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeRegular, size: size)!
        return iconAwesome(name.rawValue,size:size,color:color,font:font)
    }
    
    public func icon(_ name:AwesomeSolid,size:CGFloat,color:UIColor = .black) -> NSAttributedString {
        let font:UIFont = UIFont(name: FontNames.awesomeSolid, size: size)!
        return iconAwesome(name.rawValue,size:size,color:color,font:font)
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
        let font:UIFont = UIFont(name: FontNames.awesomeRegular, size: fontSize)!
        
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
    
    public static func fontAwesomeIcon(name: AwesomeSolid, textColor: UIColor, size: CGSize, backgroundColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) -> UIImage {
        
        // Prevent application crash when passing size where width or height is set equal to or less than zero, by clipping width and height to a minimum of 1 pixel.
        var size = size
        if size.width <= 0 { size.width = 1 }
        if size.height <= 0 { size.height = 1 }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        
        let fontSize = min(size.width / FontAwesomeConfig.fontAspectRatio, size.height)
        
        // stroke width expects a whole number percentage of the font size
        let strokeWidth: CGFloat = fontSize == 0 ? 0 : (-100 * borderWidth / fontSize)
        let font:UIFont = UIFont(name: FontNames.awesomeSolid, size: fontSize)!
        
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
    
    public static func fontAwesomeIcon(name: AwesomeBrand, textColor: UIColor, size: CGSize, backgroundColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) -> UIImage {
        
        // Prevent application crash when passing size where width or height is set equal to or less than zero, by clipping width and height to a minimum of 1 pixel.
        var size = size
        if size.width <= 0 { size.width = 1 }
        if size.height <= 0 { size.height = 1 }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        
        let fontSize = min(size.width / FontAwesomeConfig.fontAspectRatio, size.height)
        
        // stroke width expects a whole number percentage of the font size
        let strokeWidth: CGFloat = fontSize == 0 ? 0 : (-100 * borderWidth / fontSize)
        let font:UIFont = UIFont(name: FontNames.awesomeBrand, size: fontSize)!
        
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



