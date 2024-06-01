//
//  ColorUtils.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation
import UIKit

// MARK: - ColorUtils
public class ColorUtils {
    
    static func color(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        
        var string: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if string.hasPrefix("#") {
            string.remove(at: string.startIndex)
        }
        
        guard string.count == 6 else {
            return UIColor.clear
        }
        
        var value: UInt32 = 0
        
        Scanner(string: string).scanHexInt32(&value)
        
        let intRed = (value & 0xFF0000) >> 16
        let intGreen = (value & 0x00FF00) >> 8
        let intBlue = (value & 0x0000FF)
        
        let scaledRed = CGFloat(intRed) / 255.0
        let scaledGreen = CGFloat(intGreen) / 255.0
        let scaledBlue = CGFloat(intBlue) / 255.0
        
        return UIColor(red: scaledRed, green: scaledGreen, blue: scaledBlue, alpha: alpha)
    }
    
    public static func hexCode(color: UIColor) -> String {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let rgb: Int = ((Int)(red * 255) << 16) | ((Int)(green * 255) << 8) | ((Int)(blue * 255) << 0)
        
        let hexCode = String(format: "#%06x", rgb)
        
        return hexCode
    }
}

// MARK: - ColorConvertible
public extension ColorConvertible {
    
    var uiColor: UIColor {
        return ColorUtils.color(hex: self.code, alpha: self.alpha)
    }
    
    var cgColor: CGColor {
        return self.uiColor.cgColor
    }
}
