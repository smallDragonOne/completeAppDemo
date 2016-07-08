//
//  WhiTigFirsrViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/18.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

///  白虎自定义图画
class WhiTigFirsrViewController: UIViewController {
    
    weak var shapLayer: CAShapeLayer!
    
    weak var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        shapLayer = shaperPicture()
        self.view.layer.addSublayer(shapLayer)
        lineByround()
        // Do any additional setup after loading the view.
        
        if Common.getTopActivity1() === self{
            print("it is very ok ok ok ")
        }
        else{
            print("妈蛋")
            print(Common.getTopActivity1())
        }
    }
    
    /// 图画人形形状
    func shaperPicture()->CAShapeLayer{
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 175, y: 100))
        path.addArcWithCenter(CGPoint(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        path.moveToPoint(CGPoint(x: 150, y: 125))
        path.addLineToPoint(CGPoint(x: 150, y: 175))
        path.addLineToPoint(CGPoint(x: 125, y: 225))
        path.moveToPoint(CGPoint(x: 150, y: 175))
        path.addLineToPoint(CGPoint(x: 175, y: 225))
        path.moveToPoint(CGPoint(x: 100, y: 150))
        path.addLineToPoint(CGPoint(x: 200, y: 150))
        
        
        let _shapLayer = CAShapeLayer()
        _shapLayer.strokeColor = UIColor.redColor().CGColor
        _shapLayer.fillColor = UIColor.clearColor().CGColor
        _shapLayer.lineWidth = 5
        _shapLayer.lineJoin = kCALineJoinRound
        _shapLayer.lineCap = kCALineCapRound
        _shapLayer.path = path.CGPath
        _shapLayer.strokeStart = 0
        _shapLayer.strokeEnd = 1
        return _shapLayer

    }
    
    /// 绘制三段曲线
    func lineByround(){
        let threeLine = UIBezierPath()
        threeLine.moveToPoint(CGPoint(x: 40, y: 300))
        threeLine.addCurveToPoint(CGPoint(x: 400, y: 300), controlPoint1: CGPoint(x: 110, y: 200), controlPoint2: CGPoint(x: 330, y: 400))
        
        let LineShaper = CAShapeLayer()
        LineShaper.fillColor = UIColor.clearColor().CGColor
        LineShaper.lineCap = kCALineCapRound
        LineShaper.lineJoin = kCALineJoinRound
        LineShaper.strokeColor = UIColor.redColor().CGColor
        LineShaper.lineWidth = 2
        LineShaper.path = threeLine.CGPath
        
        self.view.layer.addSublayer(LineShaper)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
        /***********绘制图形动画************/
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 2
        animation.fromValue = 0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.toValue = 1
        shapLayer.addAnimation(animation, forKey: "Define")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
