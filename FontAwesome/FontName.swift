//
//  FontName.swift
//  FontAwesome
//
//  Created by Reona Kubo on 2018/02/12.
//  Copyright © 2018年 Reona Kubo. All rights reserved.
//

import Foundation

extension UIFont {
    
    convenience init?(name: FontNames, size: CGFloat) {
        self.init(name: name.rawValue, size: size)
        
    }
    
}

public enum FontNames: String {

    case awesomeRegular = "FontAwesome5FreeRegular"

    case awesomeSolid = "FontAwesome5FreeSolid"

    case awesomeBrand = "FontAwesome5BrandsRegular"

}


