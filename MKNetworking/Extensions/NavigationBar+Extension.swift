//
//  NavigationBar+Extension.swift
//
//

import Foundation
import UIKit

public extension UINavigationItem{
    
    func hideBackButtonText(){
        self.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}

public extension UINavigationController{
    
    func popViewControllerTill(number:Int){
        let viewControllers: [UIViewController] = self.viewControllers as [UIViewController]
        let totalViewControllerCount = viewControllers.count
        if number <= totalViewControllerCount{
            self.popToViewController(viewControllers[viewControllers.count - number], animated: true)
        }else{
            print("Number is greater than view controllers count")
        }
    }
}






















































































































































//MARK:- Add Code Below This

extension UINavigationController{
    
//    func makeNavigationBarTransparent(){
//        //Make navigation bar transparent
//        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationBar.shadowImage = UIImage()
//        self.navigationBar.isTranslucent = true
//        self.view.backgroundColor = .clear
//    }
}
