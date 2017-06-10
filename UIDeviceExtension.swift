//
//  UIDeviceExtension.swift
//  Reza Ranjbaran
//
//  Created by Reza Rg on 2/17/15.
//  Copyright (c) 2015 Reza Ranjbaran. All rights reserved.
//

extension UIDevice {
    
    //Device Code : iPhone7,2, iPhone6,1, ...
    public var deviceCode: String {
        
        //        var sysinfo = utsname()
        //        uname(&sysinfo) // ignore return value
        //        return NSString(bytes: &sysinfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)! as String
        var c = ""
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        _ = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else {
                c = identifier.description
                return identifier
            }
            c = identifier
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return c
    }
    
    // Device Family : iPhone,iPad, ...
    var deviceFamily: String {
        
        return UIDevice.current.model
    }
    
    //Device Model : iPhone 6, iPhone 6 plus, iPad Air, ...
    var deviceModel: String {
        
        var model : String
        let deviceCode = UIDevice().deviceCode
        switch deviceCode {
            
        case "iPod1,1":                                 model = "iPod Touch 1G"
        case "iPod2,1":                                 model = "iPod Touch 2G"
        case "iPod3,1":                                 model = "iPod Touch 3G"
        case "iPod4,1":                                 model = "iPod Touch 4G"
        case "iPod5,1":                                 model = "iPod Touch 5G"
        case "iPod7,1":                                 model = "iPod Touch 6G"
            
        case "iPhone1,1":                               model = "iPhone 2G"
        case "iPhone1,2":                               model = "iPhone 3G"
        case "iPhone2,1":                               model = "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     model = "iPhone 4"
        case "iPhone4,1":                               model = "iPhone 4S"
        case "iPhone5,1", "iPhone5,2":                  model = "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  model = "iPhone 5C"
        case "iPhone6,1", "iPhone6,2":                  model = "iPhone 5S"
        case "iPhone7,2":                               model = "iPhone 6"
        case "iPhone7,1":                               model = "iPhone 6 Plus"
        case "iPhone8,1":                               model = "iPhone 6S"
        case "iPhone8,2":                               model = "iPhone 6S Plus"
        case "iPhone8,4":                               model = "iPhone SE"
        case "iPhone9,1", "iPhone9,3":                  model = "iPhone 7"
        case "iPhone9,2", "iPhone 9,4":                 model = "iPhone 7 Plus"
            
            
        case "iPad1,1":                                 model = "iPad 1"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":model = "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           model = "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           model = "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           model = "iPad Air"
        case "iPad5,1", "iPad5,3", "iPad5,4":           model = "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           model = "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           model = "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           model = "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      model = "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      model = "iPad Pro"
        case "iPad6,7", "iPad6,8":                      model = "iPad Pro (12.9 inch)"
        case "iPad6,3", "iPad6,4":                      model = "iPad Pro (9.7 inch)"
            
            
        case "i386", "x86_64":                          model = "Simulator"
        default:                                        model = deviceCode //If unkhnown
        }
        
        return model
    }
    
    //Device Jailbreaked or not
    var deviceJailed: Bool {
        //        let path : NSString = "/Applications/Cydia.app"
        //        let fileExists : Bool = FileManager.default.fileExists(atPath: path as String)
        //        return fileExists
        let fileManager = FileManager.default
        if(fileManager.fileExists(atPath: "/private/var/lib/apt")) {
            //"Jailbroken Device"
            return true
        } else {
            //"Clean Device"
            return false
        }
    }
    
    //Device iOS Version : 8.1, 8.1.3, ...
    var deviceIOSVersion: String {
        let c = UIDevice.current.systemVersion
        return c
    }
    
    //Device Screen Width and Height
    var deviceScreenWidth: CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        let width = screenSize.width;
        return width
    }
    var deviceScreenHeight: CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        let height = screenSize.height;
        return height
    }
    
    //Device Remaining free space
    //TODO REMOVED BY REZA
    //    public var deviceFreeSpace: Int64? {
    //        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    //        if let systemAttributes = try! NSFileManager.defaultManager().attributesOfFileSystemForPath(documentDirectoryPath.last as String!) {
    //            if let freeSize = systemAttributes[NSFileSystemFreeSize] as? NSNumber {
    //                return freeSize.longLongValue
    //            }
    //        }
    //        return nil
    //    }
    
    //Device Orientation String
    var deviceOrientationString: String {
        
        var orientation : String
        
        switch UIDevice.current.orientation{
        case .portrait:
            orientation="Portrait"
        case .portraitUpsideDown:
            orientation="Portrait Upside Down"
        case .landscapeLeft:
            orientation="Landscape Left"
        case .landscapeRight:
            orientation="Landscape Right"
        case .faceUp:
            orientation="Face Up"
        case .faceDown:
            orientation="Face Down"
        default:
            orientation="Unknown"
        }
        
        return orientation
    }
    
    
    // is Device Landscape, is Portrait
    var isDevicePortrait: Bool {
        return UIDevice.current.orientation.isPortrait
    }
    var isDeviceLandscape: Bool {
        return UIDevice.current.orientation.isLandscape
    }
    
}
