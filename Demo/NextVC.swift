//
//  NextVC.swift
//  Demo
//
//  Created by 杨林杰 on 2018/5/4.
//  Copyright © 2018年 YLJ. All rights reserved.
//

import UIKit

class NextVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "下一页"
        view.backgroundColor = UIColor.white
    }

    override func navigationShouldPopMethod() -> Bool {
        print("执行返回操作")
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
