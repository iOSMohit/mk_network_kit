//
//  UITableView+Extension.swift
//

import Foundation
import UIKit

public extension UITableView{
    
    func showBackgroundView(){
        self.backgroundView?.isHidden = false
    }
    
    func hideBackgroundView(){
        self.backgroundView?.isHidden = true
    }
    
    func reload(){
        DispatchQueue.main.async {
            //Get Main Thread
            self.reloadData()
        }
    }
    
    func jumpTo(_ indexPath:IndexPath,animated:Bool){
        DispatchQueue.main.async {
            //Get Main Thread
            self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
        }
    }
    
    func makeCellAutoResizable(){
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 1000
    }
    
    func addFooterView(){
        let footerView = UIView.init(frame: .zero)
        self.tableFooterView = footerView
    }
    
    func makeHeaderAutoResizable(){
        self.sectionHeaderHeight = UITableView.automaticDimension
        self.estimatedSectionHeaderHeight = 1000
    }
    
}










































































































































































