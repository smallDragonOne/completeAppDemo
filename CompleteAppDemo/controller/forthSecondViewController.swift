//
//  forthSecondViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/13.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit
/// 玄武相关页1
class forthSecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        let _cusTomView = CustiomView(frame: CGRectMake(40, 10, 400, 400))
        _cusTomView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(_cusTomView)
        
        
        let preBtn = UIButton(frame: CGRectMake(100 , 100 , 100 , 100))
        preBtn.backgroundColor = UIColor.redColor()
        self.view.addSubview(preBtn)
        preBtn.addTarget(self, action: "gotoLuanxie", forControlEvents: UIControlEvents.TouchUpInside)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gotoLuanxie(){
        let next = ForthLuanxiedeViewController()
        self.presentViewController(next, animated: true, completion: nil)
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
