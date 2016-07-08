//
//  GreenDragonViewController.swift
//  CompleteAppDemo
//
//  Created by zj on 16/1/6.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit
/// 青龙页
class GreenDragonViewController: UIViewController, UISearchBarDelegate,UIWebViewDelegate{
    
    @IBOutlet weak var CancelBtn: UIButton!
    @IBOutlet weak var CancelH: NSLayoutConstraint!
    /// 有滚动的view（uiwebView && ）
    @IBOutlet weak var NewView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var searchKey: UISearchBar!
    @IBOutlet weak var webViewGren: UIWebView!
    var searchUrl =  ""
    override func viewDidLoad() {
        super.viewDidLoad()
        CancelBtn.hidden = true
        /// 监听键盘
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showCanCelBtn", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "CancelKeyBoard", name: UIKeyboardWillHideNotification, object: nil)
        
        self.navigationController?.hidesBarsWhenKeyboardAppears = true
        ///***********测试范围代码***********///
//        NewView.layer.borderColor = UIColor.greenColor().CGColor
//        NewView.layer.borderWidth = 2
//        webViewGren.layer.borderColor = UIColor.redColor().CGColor
//        webViewGren.layer.borderWidth = 1
        //        /// 换导航背景
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navgationImage.jpeg"), forBarMetrics: UIBarMetrics.Default)
        ///self.view.backgroundColor = UIColor(red: 211 / 255, green: 211 / 255, blue: 211 / 255, alpha: 1)
        searchKey.delegate = self
        self.webViewGren.allowsInlineMediaPlayback = true
        self.webViewGren.delegate = self
        self.webViewGren.scalesPageToFit = true
    }
    
    func showCanCelBtn(){
        CancelH.constant = 60
        CancelBtn.hidden = false
        self.navigationController?.hidesBarsOnTap = true
    }
    
    func CancelKeyBoard(){
        CancelH.constant = 0
        CancelBtn.hidden = true
        self.navigationController?.hidesBarsOnTap = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        webViewGren.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.baidu.com")!))
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.progressView.setProgress(0, animated: true)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.progressView.setProgress(0.6, animated: true)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.progressView.setProgress(1, animated: true)
        let timeT = DISPATCH_TIME_NOW
        dispatch_after(dispatch_time(timeT, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { [weak self]() -> Void in
            if let strongSelf = self {
                strongSelf.progressView.progress = 0
            }
            
        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    
    @IBAction func goBackToFirstPage(sender: AnyObject) {
        ///var number = self.navigationController?.viewControllers.count
        /****************测试代码，可以返回上一个页面或者指定页面*********************/
        /*if let control = self.navigationController?.viewControllers[number! - 2] as? UIViewController{
            if control is FirstViewController{
                self.navigationController?.popToViewController(control, animated: true)
            }
        }*/
        self.CancelH.constant = 0
        if self.searchKey.becomeFirstResponder(){
            self.searchKey.resignFirstResponder()
        }
        
        ///self.navigationController?.hidesBarsOnTap = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        
        var url: NSURL?
        var url1:NSURL?
        let keyWorld = escapes(self.searchKey.text!)
        let startWord = "https://www.baidu.com/baidu?tn=monline_3_dg&ie=utf-8&wd=\(keyWorld)"
        let NumOrAlp = "https://www.baidu.com/baidu?tn=monline_3_dg&ie=utf-8&wd=\(self.searchKey.text)"
        if self.searchKey.text!.hasSuffix(".com"){
             url = NSURL(string: "https://www." + self.searchKey.text!)
            url1 = NSURL(string: "https://" + self.searchKey.text!)
        }
        if url != nil  {
            self.webViewGren.loadRequest(NSURLRequest(URL: url!))
        }
        else if url1 != nil{
            self.webViewGren.loadRequest(NSURLRequest(URL: url1!))
        }
        else if NSURL(string: startWord) != nil {
            self.webViewGren.loadRequest(NSURLRequest(URL: NSURL(string: startWord)!))
        }
        else{
             self.webViewGren.loadRequest(NSURLRequest(URL: NSURL(string: NumOrAlp)!))
        }
        
        self.searchKey.resignFirstResponder()
    }
    

    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        CancelH.constant = 0
        CancelBtn.hidden = true
        return true
    }
    
    /// 处理中文及相关不常用符号
    func escapes(string: String) -> String {
        let legalURLCharactersToBeEscaped: CFStringRef = ":&=;+!@#$()',*"
        return CFURLCreateStringByAddingPercentEscapes(nil, string, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
    }
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil
        )
    }
    

}
