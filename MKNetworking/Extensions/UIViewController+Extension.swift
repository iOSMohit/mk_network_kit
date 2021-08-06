//
//  UIViewController+Extension.swift
//  ReadList
//
//  Created by Mohit Kumar on 21/01/21.
//

import Foundation
import UIKit

public extension UIViewController{
    
    func hideKeyboard(){
        self.view.endEditing(true)
    }
}

public extension UIViewController {
    func topMostViewController() -> UIViewController {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController!.topMostViewController()
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
}

public extension UIApplication {
    func topMostViewController() -> UIViewController? {
        return UIWindow.key!.rootViewController?.topMostViewController()
    }
}

public extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
