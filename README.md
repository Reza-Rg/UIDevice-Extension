# UIDevice-Extension

UIDevice extension for easier access to some of device info.
It's compeletly appstore safe.
You can easily access device model, code, family, orientation, free sapace and ...

# Installation

Drag and drop `DeviceExtension.swift` to your project.

# Usage

Use it like below :

        var device : UIDevice = UIDevice()
        
        println("Device family is  \(device.deviceFamily)")               // iPhone, iPad, iPod
        println("Device code is \(device.deviceCode)")                    // iphone7,1, iphone6,2, ...
        println("Device model is \(device.deviceModel)")                  // iPhone 6, iPhone 5S, iPad Air, ...
        
        println("Device iOS version \(device.deviceIOSVersion)")          // iOS Version : 8.1, 8.0, ...
        println("Is device jailed? \(device.deviceJailed)")               // check if device is jailed or not
        
        println("Screen width \(device.deviceScreenWidth)")               // screen size width
        println("Screen height \(device.deviceScreenHeight)")             // screen size height

        println("Device orientation \(device.deviceOrientationString)")   // Orientation : Landscape, Portrate, ...
        println("Is device portrait \(device.isDevicePortrait)")          // is Device Portrait
        println("Is device landscape \(device.isDeviceLandscape)")        // is Device Landscape
        
        println("Device free Space \(device.deviceFreeSpace)")            // Device free Space : 201345678
        

