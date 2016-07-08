//
//  File.swift
//  CompleteAppDemo
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 mountor_zj. All rights reserved.
//

import UIKit

/// 扩展UIView寻找控制器
extension UIView{
    func findController()->UIViewController!{
        return self.findControlWithClass(UIViewController.self)
    }
    
    func findNavController()->UINavigationController!{
        return self.findControlWithClass(UINavigationController.self)
    }
    
    /*******调用的时候需要显示的指出类型************/
    func findControlWithClass<T>(AnyCla: AnyClass) -> T?{
        var responder = self.nextResponder()
        while responder != nil{
            if responder!.isKindOfClass(AnyCla){
                return responder as? T
            }
            responder = responder?.nextResponder()
        }
        return nil
    }
    
}