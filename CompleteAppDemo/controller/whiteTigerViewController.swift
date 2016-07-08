
//
//  whiteTigerViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/13.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

class whiteTigerViewController: UIViewController , UITextFieldDelegate{
    weak var welImg: UIImageView!
    weak var button: HamburgerButton!
    weak var ZjtextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.shadowColor = UIColor.brownColor().CGColor
        self.view.layer.shadowOffset = CGSize(width: 1, height: 1)
        ///self.view.backgroundColor = UIColor(red: 38.0 / 255, green: 151.0 / 255, blue: 68.0 / 255, alpha: 1)
        self.view.backgroundColor = UIColor.orangeColor()
        /// 汉堡包约束动画
        let _button = HamburgerButton()
        _button.translatesAutoresizingMaskIntoConstraints = false
        button = _button
        self.view.addSubview(button)
        
        ///self.button = HamburgerButton(frame: CGRectMake(133, 133, 54, 54))
        self.button.addTarget(self, action: "toggle:", forControlEvents:.TouchUpInside)
        
        let buttonCenX = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        let buttonConY = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY , multiplier: 1, constant: 0)
        let buttonH = NSLayoutConstraint.constraintsWithVisualFormat("V:[button(==54)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button":button])
        let buttonW = NSLayoutConstraint.constraintsWithVisualFormat("H:[button(==54)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button":button])
        
        
        buttonCenX.active = true
        buttonConY.active = true
        NSLayoutConstraint.activateConstraints(buttonH)
        NSLayoutConstraint.activateConstraints(buttonW)
//        let label = UILabel()
//        label.setTranslatesAutoresizingMaskIntoConstraints(false)
//        label.text = "OK版本"
//        self.view.addSubview(label)
        ///********在viewdidload中铺写约束，不会在hidesBottomBarWhenPushed 出现页面下移情况，直接在故事版上加约束需要在故事版的view上覆盖一层view
//        let consV = NSLayoutConstraint.constraintsWithVisualFormat("V:[label(==20)]-10-|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: ["label":label])
//        let LabelW = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 80)
//        let labelcent = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
//        LabelW.active = true
//        labelcent.active = true
//        NSLayoutConstraint.activateConstraints(consV)
        ///NSLayoutConstraint.activateConstraints(conH)
        // Do any additional setup after loading the view.
        /// 输入框
        let Zjimage = UIImage(named: "littleIImg.png")
        let Zjleft =  UIImageView(frame: CGRectMake(0, 0, 50, 50))
        Zjleft.image = Zjimage
        let _ZjtextField = UITextField(frame: CGRectMake(40, 10, win_w - 70, 50))
        ZjtextField = _ZjtextField
        ZjtextField.backgroundColor = UIColor.whiteColor()
        ZjtextField.layer.borderWidth = 1
        ZjtextField.layer.cornerRadius = 10
        ZjtextField.font = UIFont(name: "Arial", size: 13)
        ZjtextField.delegate = self
        ZjtextField.returnKeyType = UIReturnKeyType.Done
        ZjtextField.leftView = Zjleft
        ZjtextField.leftViewMode = UITextFieldViewMode.Always
        ZjtextField.placeholder = "输入你的芳名（不要输入数字）"
        ZjtextField.layer.borderColor = UIColor.orangeColor().CGColor
        
        ///阴影，设置了maskbounds ＝ true后不能使用阴影
//        ZjtextField.layer.shadowColor = UIColor.blackColor().CGColor
//        ZjtextField.layer.shadowOpacity = 1
//        ZjtextField.layer.shadowRadius = 5
//        ZjtextField.layer.shadowOffset = CGSize(width: 1, height: 1)
//        ZjtextField.clipsToBounds = false
        self.view.addSubview(ZjtextField)
        
        /// 欢迎图片
        let _welImg = UIImageView(frame: CGRectZero)
        welImg = _welImg
        welImg.center = CGPoint(x: win_w / 2 , y: 150)
        welImg.image = UIImage(named: "welcome.jpg")
        self.view.addSubview(welImg)
        
        
        if Common.getTopViewController() === self{
            print("it is right")
        }
        else{
            print("it is wrong")
            print(Common.getTopViewController()?.description)
        }

        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.BeginFromCurrentState, animations: {
            [weak self] _ in if let strongSelf = self{
                strongSelf.welImg.frame.size = CGSize(width: 150, height: 150)
                strongSelf.welImg.center = CGPoint(x: win_w / 2 , y: 150)
              }
            }, completion: nil)
        Common.AlertLabel(self.view ,Labels: "章鱼哥欢迎您!")
    }
    /// 执行动画
    func action(){
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [0 ,-20,10, -10,0]
        animation.keyTimes = [0 , 0.2 ,0.5, 0.7, 1]
        animation.duration = 0.4
        animation.additive = true
        ZjtextField.layer.addAnimation(animation, forKey: "shake")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggle(sender: AnyObject!) {
        self.button.showsMenu = !self.button.showsMenu
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        ZjtextField.resignFirstResponder()
        for i in 0...9{
            if (self.ZjtextField.text! as NSString).containsString("\(i)"){
                action()
            }
        }
        return true
    }

}
