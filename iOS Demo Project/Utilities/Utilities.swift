//
//  Utilities.swift
//  iOS Demo Project
//
//  Created by Ahmer Hassan on 12/02/2021.
//  Copyright © 2021 Ahmer Hassan. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static let url = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
}

class HelpingClass {
    static func ApplyShadow(ViewPlaceHolder : UIView,shadowRadius:Int)
    {
        ViewPlaceHolder.layer.shadowColor = UIColor.lightGray.cgColor//#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        ViewPlaceHolder.layer.shadowOpacity = 0.4
        ViewPlaceHolder.layer.shadowOffset = CGSize(width: 0, height: 4)//CGSize.zero
        ViewPlaceHolder.layer.shadowRadius = CGFloat(shadowRadius)
        ViewPlaceHolder.layer.masksToBounds = false;
        ViewPlaceHolder.backgroundColor = UIColor.white
    }
    
    
}


extension  Notification.Name {
    static let removeAnimationView = Notification.Name("removeAnimationView")
}

extension UIViewController {
    
    func checkConnectivity()-> Bool  {
        if !(CheckInternet.Connection()) {
            let alert = UIAlertController(title: "Network Alert", message: "Facing Problems while Connecting to Internet", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            return false
        }
        else {
            return true
        }
        
    }
    
    func setupTopNavBar(viewPlaceholder: UIView)  {
           viewPlaceholder.layer.shadowColor = UIColor.lightGray.cgColor
           viewPlaceholder.layer.shadowOpacity = 0.4
           viewPlaceholder.layer.shadowOffset = CGSize(width: 0, height: 5)
           viewPlaceholder.layer.shadowRadius = 3
           viewPlaceholder.layer.masksToBounds = false;
           viewPlaceholder.backgroundColor = UIColor.white
           viewPlaceholder.layer.cornerRadius = 30
           viewPlaceholder.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] // bottom left corner, bottom right corner respectively
       }
    func showAnimationView() {
        if let subView = Bundle.main.loadNibNamed("LoaderAnimationView", owner: nil, options: nil)?.first as? LoaderAnimationView {
            subView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height )
            subView.animateView()
            self.view.addSubview(subView)
        }
    }
}
