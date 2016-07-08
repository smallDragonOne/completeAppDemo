//
//  FirstViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/6.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        /// 换导航背景
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navgationImage.jpeg"), forBarMetrics: UIBarMetrics.Default)
        /// 只可以转换成 UIViewController 不能转换成自定义类
        /// 设置badge数量的两种方式 设置nil为不现实badge
//        if let tabBar1 = self.tabBarController?.viewControllers?[2] as? UIViewController{
//            tabBar1.tabBarItem.badgeValue = nil
//        }
//        if let tabBar = self.tabBarController?.tabBar.items![2] as? UITabBarItem{
//            tabBar.badgeValue = "10"
//        }
    
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false
        let alert = UIAlertController(title: "更新", message: "更新的内容包括……等", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "确定", style: .Destructive, handler: { (name) -> Void in
            print(1111)
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .Destructive, handler: { (cancel) -> Void in
            print(222)
        }))
        
        alert.addAction(UIAlertAction(title: "yesOrnot", style: .Destructive, handler: { _ in
            let alert2 = UIAlertController(title: "Next", message: "哈看见符合进口国分", preferredStyle: .Alert)
            alert2.addAction(UIAlertAction(title: "Go", style: .Destructive, handler: { (name) -> Void in
                print("alert2")
            }))
            self.presentViewController(alert2, animated: true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
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
