//
//  UIFont.swift
//  Login_Screen
//
//  Created by alios on 5/16/1404 AP.
//


import UIKit
 

extension UIFont{
    class func buttonFont(size: CGFloat = 27) -> UIFont{
        UIFont(name: "IRANYekan Bold", size: size)!
    }
    class func textFieldFont(size: CGFloat = 17) -> UIFont{
        UIFont(name: "IRANYekan Medium", size: size)!
        
    }
    class func buttonFont(size: CGFloat = 17) -> UIFont?{
        UIFont(name: "IRANYekan Medium", size: size)!
        
    }
    
}
