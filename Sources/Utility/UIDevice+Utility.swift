//
//  UIDevice+Utility.swift
//  Kingfisher
//
//  Created by jingpengbo on 2021/3/15.
//
//  Copyright (c) 2021 Wei Wang <onevcat@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

internal enum UIDeviceModel {
    case iPod_Touch_5
    case iPod_Touch_6
    case iPhone_4
    case iPhone_4s
    case iPhone_5
    case iPhone_5c
    case iPhone_5s
    case iPhone_6
    case iPhone_6_Plus
    case iPhone_6s
    case iPhone_6s_Plus
    case iPhone_SE
    case iPhone_7
    case iPhone_7_Plus
    case iPhone_8
    case iPhone_8_Plus
    case iPhone_X
    case iPhone_Xr
    case iPhone_Xs
    case iPhone_Xs_Max
    case iPhone_11
    case iPhone_11_Pro
    case iPhone_11_Pro_Max
    case iPhone_SE_2nd_Gen
    case iPhone_12_Mini
    case iPhone_12
    case iPhone_12_Pro
    case iPhone_12_Pro_Max
    case iPad
    case iPad_2
    case iPad_3
    case iPad_4
    case iPad_Air
    case iPad_Air_2
    case iPad_Mini
    case iPad_Mini_2
    case iPad_Mini_3
    case iPad_Mini_4
    case iPad_Pro_9_7
    case iPad_Pro_12_9
    case iPad_5
    case iPad_6
    case iPad_7
    case Apple_TV
    case Simulator
    case unknwon(String)
    
    func rawValue() -> String {
        switch self {
        case .iPod_Touch_5 :
            return "iPod Touch 5"
        case .iPod_Touch_6 :
            return "iPod Touch 6"
        case .iPhone_4 :
            return "iPhone 4"
        case .iPhone_4s :
            return "iPhone 4s"
        case .iPhone_5 :
            return "iPhone 5"
        case .iPhone_5c :
            return "iPhone 5c"
        case .iPhone_5s :
            return "iPhone 5s"
        case .iPhone_6 :
            return "iPhone 6"
        case .iPhone_6_Plus :
            return "iPhone 6 Plus"
        case .iPhone_6s :
            return "iPhone 6s"
        case .iPhone_6s_Plus :
            return "iPhone 6s Plus"
        case .iPhone_SE :
            return "iPhone SE"
        case .iPhone_7 :
            return "iPhone 7"
        case .iPhone_7_Plus :
            return "iPhone 7 Plus"
        case .iPhone_8 :
            return "iPhone 8"
        case .iPhone_8_Plus :
            return "iPhone 8 Plus"
        case .iPhone_X :
            return "iPhone X"
        case .iPhone_Xr :
            return "iPhone Xr"
        case .iPhone_Xs :
            return "iPhone Xs"
        case .iPhone_Xs_Max :
            return "iPhone Xs Max"
        case .iPhone_11 :
            return "iPhone 11"
        case .iPhone_11_Pro :
            return "iPhone 11 Pro"
        case .iPhone_11_Pro_Max :
            return "iPhone 11 Pro Max"
        case .iPhone_SE_2nd_Gen :
            return "iPhone SE 2nd Gen"
        case .iPhone_12_Mini :
            return "iPhone 12 Mini"
        case .iPhone_12 :
            return "iPhone 12"
        case .iPhone_12_Pro :
            return "iPhone 12 Pro"
        case .iPhone_12_Pro_Max :
            return "iPhone 12 Pro Max"
        case .iPad :
            return "iPad"
        case .iPad_2 :
            return "iPad 2"
        case .iPad_3 :
            return "iPad 3"
        case .iPad_4 :
            return "iPad 4"
        case .iPad_Air :
            return "iPad Air"
        case .iPad_Air_2 :
            return "iPad Air 2"
        case .iPad_Mini :
            return "iPad Mini"
        case .iPad_Mini_2 :
            return "iPad Mini 2"
        case .iPad_Mini_3 :
            return "iPad Mini 3"
        case .iPad_Mini_4 :
            return "iPad Mini 4"
        case .iPad_Pro_9_7 :
            return "iPad Pro 9.7"
        case .iPad_Pro_12_9 :
            return "iPad Pro 12.9"
        case .iPad_5 :
            return "iPad 5"
        case .iPad_6 :
            return "iPad 6"
        case .iPad_7 :
            return "iPad 7"
        case .Apple_TV :
            return "Apple TV"
        case .Simulator :
            return "Simulator"
        case .unknwon(let modelName) :
            return modelName
        }
    }
}


internal extension UIDevice {
    
    // https://stackoverflow.com/questions/5887248/ios-app-maximum-memory-budget/15200855#15200855
    var modelName: UIDeviceModel {
        let identifier = deviceIdentifier
        switch identifier {
        case "iPod5,1":                                      return .iPod_Touch_5
        case "iPod7,1":                                      return .iPod_Touch_6

        case "iPhone3,1", "iPhone3,2", "iPhone3,3":          return .iPhone_4
        case "iPhone4,1":                                    return .iPhone_4s
        case "iPhone5,1", "iPhone5,2":                       return .iPhone_5
        case "iPhone5,3", "iPhone5,4":                       return .iPhone_5c
        case "iPhone6,1", "iPhone6,2":                       return .iPhone_5s
        case "iPhone7,2":                                    return .iPhone_6
        case "iPhone7,1":                                    return .iPhone_6_Plus
        case "iPhone8,1":                                    return .iPhone_6s
        case "iPhone8,2":                                    return .iPhone_6s_Plus
        case "iPhone8,4":                                    return .iPhone_SE
        case "iPhone9,1", "iPhone9,3":                       return .iPhone_7
        case "iPhone9,2", "iPhone9,4":                       return .iPhone_7_Plus
        case "iPhone10,1", "iPhone10,4":                     return .iPhone_8
        case "iPhone10,2", "iPhone10,5":                     return .iPhone_8_Plus
        case "iPhone10,3", "iPhone10,6":                     return .iPhone_X
        case "iPhone11,8":                                   return .iPhone_Xr
        case "iPhone11,2":                                   return .iPhone_Xs
        case "iPhone11,4", "iPhone11,6":                     return .iPhone_Xs_Max
        case "iPhone12,1":                                   return .iPhone_11
        case "iPhone12,3":                                   return .iPhone_11_Pro
        case "iPhone12,5":                                   return .iPhone_11_Pro_Max
        case "iPhone12,8":                                   return .iPhone_SE_2nd_Gen
        case "iPhone13,1":                                   return .iPhone_12_Mini
        case "iPhone13,2":                                   return .iPhone_12
        case "iPhone13,3":                                   return .iPhone_12_Pro
        case "iPhone13,4":                                   return .iPhone_12_Pro_Max

        case "iPad1,1":                                      return .iPad
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":     return .iPad_2
        case "iPad3,1", "iPad3,2", "iPad3,3":                return .iPad_3
        case "iPad3,4", "iPad3,5", "iPad3,6":                return .iPad_4
        case "iPad4,1", "iPad4,2", "iPad4,3":                return .iPad_Air
        case "iPad5,3", "iPad5,4":                           return .iPad_Air_2
        case "iPad2,5", "iPad2,6", "iPad2,7":                return .iPad_Mini
        case "iPad4,4", "iPad4,5", "iPad4,6":                return .iPad_Mini_2
        case "iPad4,7", "iPad4,8", "iPad4,9":                return .iPad_Mini_3
        case "iPad5,1", "iPad5,2":                           return .iPad_Mini_4
        case "iPad6,3", "iPad6,4":                           return .iPad_Pro_9_7
        case "iPad6,7", "iPad6,8":                           return .iPad_Pro_12_9
        case "iPad6,11", "iPad6,12":                         return .iPad_5
        case "iPad7,5", "iPad7,6":                           return .iPad_6
        case "iPad7,11", "iPad7,12":                         return .iPad_7
        
        case "AppleTV3,1", "AppleTV3,2", "AppleTV5,3":       return .Apple_TV
        case "i386", "x86_64":                               return .Simulator
        default:                                             return .unknwon(identifier)
        }
    }
    
    @objc dynamic var deviceIdentifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}
