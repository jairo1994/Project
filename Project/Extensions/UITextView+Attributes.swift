//
//  UITextView+Attributes.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    @discardableResult func appendWith(color: UIColor = UIColor.darkText, ofSize: UIFont = UIFont.systemFont(ofSize: 17), text: String) -> NSMutableAttributedString{
        let attrText = NSAttributedString.makeWith(color: color, ofSize: ofSize, text)
        self.append(attrText)
        return self
    }
    
}

extension NSAttributedString {
    static func makeWith(color: UIColor = UIColor.darkText, ofSize: UIFont, _ text: String) -> NSMutableAttributedString {
        let attrs = [NSAttributedString.Key.font: ofSize, NSAttributedString.Key.foregroundColor: color]
        return NSMutableAttributedString(string: text, attributes:attrs)
    }
}
