//
//  Extension.swift
//  Demo
//
//  Created by 杨林杰 on 2018/5/4.
//  Copyright © 2018年 YLJ. All rights reserved.
//

import UIKit

/// 导航返回协议
@objc protocol NavigationProtocol {
    /// 导航将要返回方法
    ///
    /// - Returns: true: 返回上一界面， false: 禁止返回
    @objc optional func navigationShouldPopMethod() -> Bool
}

extension UIViewController: NavigationProtocol {
    func navigationShouldPopMethod() -> Bool {
        return true
    }
}

extension UINavigationController: UINavigationBarDelegate, UIGestureRecognizerDelegate {
    
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        if viewControllers.count < (navigationBar.items?.count)! {
            return true
        }
        var shouldPop = false
        let vc: UIViewController = topViewController!
        if vc.responds(to: #selector(navigationShouldPopMethod)) {
            shouldPop = vc.navigationShouldPopMethod()
        }
        if shouldPop {
            DispatchQueue.main.async {
                self.popViewController(animated: true)
            }
        } else {
            for subview in navigationBar.subviews {
                if 0.0 < subview.alpha && subview.alpha < 1.0 {
                    UIView.animate(withDuration: 0.25) {
                        subview.alpha = 1.0
                    }
                }
            }
        }
        return false
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if childViewControllers.count == 1 {
            return false
        } else {
            if topViewController?.responds(to: #selector(navigationShouldPopMethod)) != nil {
                return topViewController!.navigationShouldPopMethod()
            }
            return true
        }
    }
}
