//
//  TabBarRootViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/6.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

/// 底部根视图控制器
class TabBarRootViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.orangeColor()
//        if let tabBar1 = self.tabBarController?.viewControllers![4] as? UIViewController{
//            tabBar1.tabBarItem.badgeValue = "6"
//        }
        
        // Do any additional setup after loading the view.
        /// 显示当前页帧数
        let _fpsLabel = customFps(frame: CGRectMake(15, win_h - 70, 55, 20))
        self.view.addSubview(_fpsLabel)
        
        
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
