//
//  FourThViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/13.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

/// 玄武主页
class FourThViewController: UIViewController {
    
    
    @IBOutlet weak var goNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        /// *****设置下一页返回按钮的颜色
        
//        let item = UIBarButtonItem();
//        item.title = "暴发户"
//        self.navigationItem.backBarButtonItem = item
        
        /// 直接以下方法写是不行的，采用以上的方法***/
        //self.navigationItem.backBarButtonItem?.title  = "暴发户"
        if self.navigationItem.backBarButtonItem != nil {
            
            self.navigationItem.backBarButtonItem?.title = "暴发户"
        }
        else{

          
        }
        
        if Common.getTopActivity1() === self{
            print("it is ok")
        }
        else{
            print("it is wrong")
            print(Common.getTopActivity1()?.description)
        }
        
        
         ///self.navigationController?.navigationBar.tintColor = UIColor.blueColor()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(UInt64(2) * NSEC_PER_SEC)), dispatch_get_main_queue(), { [weak self]() -> Void in
                if let strongSelf = self {
                    let alert = UIAlertController(title: "他是空的", message: "it is wrong", preferredStyle: .Alert)
                    
                    let makesure = UIAlertAction(title: "确定", style: .Default, handler: { (makesure) -> Void in
                        print(111)
                    })
                    
                    let cancelBtn = UIAlertAction(title: "取消", style: .Cancel, handler: { (cancelBtn) -> Void in
                        
                    })
                    alert.addAction(makesure)
                    alert.addAction(cancelBtn)
                    
                    strongSelf.presentViewController(alert, animated: false, completion: nil)
                }
                })
        })
    }
    
    @IBAction func goNextAction(sender: AnyObject) {
        let next = self.storyboard!.instantiateViewControllerWithIdentifier("custiomCalss")
        next.hidesBottomBarWhenPushed = true
        
//        /// 修改返回按钮
//        let barItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Done, target: self, action: nil)
//        barItem.tintColor = UIColor.brownColor()
//        self.navigationItem.backBarButtonItem = barItem
        self.navigationController?.pushViewController(next, animated: true)
        
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
