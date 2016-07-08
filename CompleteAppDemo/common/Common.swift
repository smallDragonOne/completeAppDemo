//
//  File.swift
//  CompleteAppDemo
//
//  Created by apple on 16/1/6.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

class Common: NSObject {
    static let versionTT = UIDevice.currentDevice().systemVersion
    
    static let NameVersion = UIDevice.currentDevice().systemName
    
    
    class func AlertLabel(view:UIView ,Labels: String){
        weak var label: UILabel!
        let _label = UILabel(frame: CGRectMake(0, 0, win_w - 100, win_c * 26))
        _label.textAlignment = .Center
        _label.font = UIFont(name: "Arial", size: win_c * 15)
        _label.backgroundColor = UIColor.blackColor()
        _label.alpha = 0.7
        _label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        _label.numberOfLines = 0
        _label.text = Labels
        _label.layer.masksToBounds = true
        _label.layer.cornerRadius = 5
        _label.textColor = UIColor.whiteColor()
        label = _label
        view.addSubview(label)
        
        let size = label.sizeThatFits(label.frame.size)
        label.frame.size = size
        label.center = CGPoint(x: win_w / 2, y: 200)
        
        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
               _ in _label.alpha = 0
            
    }, completion: {
        _ in if label != nil {label.removeFromSuperview()}
    
    })
    
    }
    
    static func getTopViewController()-> UIViewController? {
        
        var keyWindow = UIApplication.sharedApplication().keyWindow
        
        if (keyWindow?.windowLevel != UIWindowLevelNormal){
            let arrWindows = UIApplication.sharedApplication().windows
            for window in arrWindows{
                if window.windowLevel == UIWindowLevelNormal{
                    keyWindow = window as UIWindow
                    break
                }
            }
        }
        
        let arrView = keyWindow?.subviews
        let view = arrView![0] as UIView
        let resopnderNow = view.nextResponder()

        if ( resopnderNow is UIViewController){
            return resopnderNow as? UIViewController
        }
        else{
            //return keyWindow?.rootViewController
            return nil
        }
    }
    
    
    static func getTopActivity1()-> UIViewController?{
        let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController
        if rootViewController is UITabBarController{
            let tabBar = rootViewController as! UITabBarController
            if tabBar.selectedViewController!.isKindOfClass(UINavigationController){
                
                if ((tabBar.selectedViewController as! UINavigationController).visibleViewController)?.presentedViewController != nil{
                    let name = (tabBar.selectedViewController as! UINavigationController).visibleViewController
                    return name?.presentedViewController
                }
                return (tabBar.selectedViewController as! UINavigationController).visibleViewController
            }
            return tabBar.selectedViewController
        }
        else if rootViewController is UINavigationController{
            let navCon = rootViewController as! UINavigationController
            return navCon.visibleViewController
        }
        else{
            return rootViewController
        }
    }
    
}