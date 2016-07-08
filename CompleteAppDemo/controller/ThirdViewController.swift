//
//  ThirdViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/6.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

/// 朱雀主页  
class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        /// 设置导航按钮颜色
//        self.navigationController?.navigationBar.tintColor = UIColor.redColor()
        /// 设置导航颜色
//        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        // Do any additional setup after loading the view.
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
