//
//  GreenTextOrViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/27.
//  Copyright © 2016年 mountor_zj. All rights reserved.
//

import UIKit

/// 青龙富文本
class GreenTextOrViewController: UIViewController {
    
    @IBOutlet weak var CustomLabel: UILabel!
    /// 字典设置富文本label
    @IBOutlet weak var dicText: UILabel!
    /// 普通设置富文本label
    @IBOutlet weak var orderText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Str = "Hello,Swift!"
        let orignStr = NSMutableAttributedString(string: Str)
        /// 设置所有字体
        orignStr.addAttribute(NSFontAttributeName, value: UIFont(name: "Arial", size: win_c * 17)!, range: NSMakeRange(0, (Str as NSString).length))
        /// 分段控制，设置不同段字体颜色  从0开始后面5个设置为红色
        orignStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(0, 5))
        
        /// 后面控制
        orignStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.orangeColor(), range: NSMakeRange(6, 5))
        orderText.attributedText = orignStr
        
        
        /****************设置字典来完成分段控制字体******************/
        let Str2: String = "dic,Swift!"
        
        
        /****相同
        print((Str2 as NSString).length)
        print(Str2.endIndex)***/
        /****不同
        print(Str2.characters.count)***/
        let attrdic = [ NSForegroundColorAttributeName: UIColor.brownColor(),
            NSFontAttributeName: UIFont.boldSystemFontOfSize(18)] ///(NSMakeRange(0, 3))) as String
        let range = Str2.startIndex..<Str2.endIndex.advancedBy(-7)  ///从后倒数第7个
        let newOrign = NSMutableAttributedString(string: Str2[range], attributes: attrdic)
        ///dicText.attributedText = newOrign
        
        let attrdic1 = [NSForegroundColorAttributeName: UIColor.blueColor(),
            NSFontAttributeName: UIFont.boldSystemFontOfSize(18)]  /// (NSMakeRange(3, Str2.length - 3)) as String
        let newOrign1 = NSMutableAttributedString(string: Str2.substringWithRange(Range(start: Str2.startIndex.advancedBy(3), end: Str2.endIndex)), attributes: attrdic1)
        
        
        let newOrign3 = NSMutableAttributedString(attributedString: newOrign)
        newOrign3.appendAttributedString(newOrign1)
        dicText.attributedText = newOrign3
        // Do any additional setup after loading the view.
        
        
        let dic1 = [NSForegroundColorAttributeName : UIColor.redColor()]
        let dic2 = [NSForegroundColorAttributeName : UIColor.blueColor()]
        let dic3 = [NSForegroundColorAttributeName: UIColor.brownColor()]
        let dic4 = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        let dic = [dic1 ,dic2 , dic3 , dic4]
        let str = ["hello ,swift!" , "小苹果"  , "hello World!", "富文本排序我神魂颠倒方法二恢复 i 儿哦韩国豆腐口感很放得开和鬼斧神工和肉 i 个" ]
        
        CustomLabel.attributedText = self.canvertString(dic, str: str)
        CustomLabel.textAlignment = .Left
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - 富文本封装
    // paramer-: dic 传入修改字符的颜色、字体等
    // paramer-: str 传入字符串
    func canvertString(dic: [[String: UIColor]] , str: [String]) -> NSMutableAttributedString?{
        if dic.count == str.count && dic != [] && str != []{
            var orignStr: NSMutableAttributedString?
            for i in 0...str.count - 1{
                let range = str[i].startIndex..<str[i].endIndex
                let orignStrNew = NSMutableAttributedString(string: str[i][range], attributes: dic[i])
                if i == 0{
                    orignStr = NSMutableAttributedString(attributedString: orignStrNew)
                }
                else{
                    orignStr?.appendAttributedString(orignStrNew)
                }
            }
            return orignStr
        }
        return nil
    }
    

}
