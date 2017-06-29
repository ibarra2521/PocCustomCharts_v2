//
//  AppColors.swift
//  DemoCharts
//
//  Created by Nivardo Ibarra on 6/22/17.
//  Copyright © 2017 Nivardo Ibarra. All rights reserved.
//

import UIKit

public enum AppColors: Int {
    
    // TODO: - Add/edit/delete custom colors whatever do you want or need.
    case orange_F68621, orange_E35205, green_39B54A, blue_188CCC, blue_00A9E0, blue_5BBEFF, blue_218CD4, gray_F0F0F0,gray_444444, gray_9B9B9B, gray_CFCFCF, gray_F9F9FC, gray_D8D8D8, gray_949494, white_FFFFFF, clearColor
    
    // TODO: - Add/edit/delete custom colors whatever do you want or need.
    public var color: UIColor {
        switch self {
        case .orange_F68621: return UIColor.colorWithHexString("#F68621")
        case .orange_E35205:  return UIColor.colorWithHexString("#E35205")
        case .green_39B54A:  return UIColor.colorWithHexString("#39B54A")
        case .blue_188CCC:  return UIColor.colorWithHexString("#188CCC")
        case .blue_5BBEFF:  return UIColor.colorWithHexString("#5BBEFF")
        case .blue_218CD4:  return UIColor.colorWithHexString("#218CD4")
        case .blue_00A9E0:  return UIColor.colorWithHexString("#00A9E0")
        case .gray_F0F0F0:  return UIColor.colorWithHexString("#F0F0F0")
        case .gray_444444:  return UIColor.colorWithHexString("#444444")
        case .gray_9B9B9B:  return UIColor.colorWithHexString("#9B9B9B")
        case .gray_CFCFCF:  return UIColor.colorWithHexString("#CFCFCF")
        case .gray_D8D8D8:  return UIColor.colorWithHexString("#D8D8D8")
        case .gray_F9F9FC:  return UIColor.colorWithHexString("#F9F9FC")
        case .gray_949494:  return UIColor.colorWithHexString("#949494")
        case .white_FFFFFF:  return UIColor.colorWithHexString("#FFFFFF")
        default: return UIColor.clear
            
        }
    }
}

// To use it: self.byButton.backgroundColor = AppColors.blue_188CCC.color

extension UIColor {
    
    // MARK: - AllianceBernstein Specific Color
    
    class public func ogc_unselectedColor() -> UIColor { // Normal Color
        return UIColor.ogc_colorWithR(140, G: 140, B: 140)
    }
    
    class public func ogc_selectedColor() -> UIColor {
        return UIColor.ogc_colorWithR(110, G: 205, B: 204)
    }
    
    //MARK: - Color Conversion
    class public func ogc_colorWithR(_ r: CGFloat, G g: CGFloat, B b: CGFloat) -> UIColor {
        return UIColor(red:CGFloat(r / 255), green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    class public func ogc_colorWithR(_ r: CGFloat, G g: CGFloat, B b: CGFloat, A a: CGFloat) -> UIColor {
        return UIColor(red:r / 255, green: g / 255.0, blue: b / 255.0, alpha: a/255.0)
    }
    
    class public func colorWithHexString (_ hex:String) -> UIColor {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        return UIColor.ogc_colorWithR(CGFloat(r), G:CGFloat(g), B:CGFloat(b), A:CGFloat(a))
    }
}
