//
//  NavigationExtension.swift
//  Empart
//
//  Created by fernando rosa on 13/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    func customizeNavAndTab()
    {
        // Customize nav and tab
        self.navigationController?.setNavigationBarBorderColor(UIColor(red: 244.0/255, green: 188.0/255, blue: 71.0/255
            , alpha: 1.0))
        self.tabBarController?.setTabBarBorderColor(UIColor(red: 244.0/255, green: 188.0/255, blue: 71.0/255
            , alpha: 1.0))
    }
}

extension UINavigationController {
    
    func setNavigationBarBorderColor(_ color:UIColor) {
        self.navigationBar.shadowImage = color.as1ptImage()
    }
}

extension UITabBarController{
    
    func setTabBarBorderColor(_ color:UIColor) {
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width:self.tabBar.frame.size.width, height: 2))
        lineView.backgroundColor = color
        self.tabBar.addSubview(lineView)
    }
}

extension UIColor {
    
    /// Converts this `UIColor` instance to a 1x1 `UIImage` instance and returns it.
    ///
    /// - Returns: `self` as a 1x1 `UIImage`.
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 2))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 2))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}


extension UIView {
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
