//
//  ForthLuanxiedeViewController.swift
//  CompleteAppDemo
//
//  Created by apple on 16/5/25.
//  Copyright © 2016年 mountor_zj. All rights reserved.
//

import UIKit

class ForthLuanxiedeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        if Common.getTopActivity1() === self{
            print("it is  is  si Right")
        }
        else{
            print("it is wrong*******")
            print(Common.getTopActivity1()?.description)
        }
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
