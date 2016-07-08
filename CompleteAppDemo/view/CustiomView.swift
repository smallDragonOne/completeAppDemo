//
//  custiomView.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/14.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

/// 自定义页 玄武
class CustiomView: UIView {
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        _ = CGRectMake(50, 100, 100, 100)
        /// 设置填充
        _ = UIGraphicsGetCurrentContext()
//        UIColor.whiteColor().set()
//        CGContextFillPath(context)
//        
//        /// 描边
//        CGContextSetRGBStrokeColor(context, 1, 106 / 255, 0, 1)
//        CGContextSetLineWidth(context, 2)
//        CGContextAddArc(context, 50, 70, 20, 0, CGFloat(2 * M_PI), 0)
//        CGContextDrawPath(context, kCGPathStroke)
        
        UIColor.redColor().setFill()
        UIColor.greenColor().setStroke()
    }

}
