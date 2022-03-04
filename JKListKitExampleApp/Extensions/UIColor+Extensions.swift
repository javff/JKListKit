//
//  UIColor+Extensions.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 04-03-22.
//

import UIKit

extension UIColor {
    static let grayScaleOn = UIColor(hexString: "#000000")
    static let grayScaleTitle = UIColor(hexString: "#555555")
    static let grayScaleLabel = UIColor(hexString: "#333333")
    static let grayScaleOff = UIColor(hexString: "#FCFCFC")
    static let primary = UIColor(hexString: "#DD8560")
}

extension UIColor {

    convenience init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if hexString.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.string.startIndex)
        }

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }

    var hexString: String {

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0

        return String(format: "#%06x", rgb)
    }
}
