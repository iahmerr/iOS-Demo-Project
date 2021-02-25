//
//  LoaderAnimationView.swift
//  iOS Demo Project
//
//  Created by Ahmer Hassan on 13/02/2021.
//  Copyright © 2021 Ahmer Hassan. All rights reserved.
//

import UIKit
import Lottie

class LoaderAnimationView: UIView {

    @IBOutlet weak var animationView: AnimationView!
    
    override func awakeFromNib() {
        HelpingClass.ApplyShadow(ViewPlaceHolder: self.animationView, shadowRadius: 10)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleDismiss), name: .removeAnimationView, object: nil)
    }
    
    func animateView(){
        let path = Bundle.main.path(forResource: "animation",
                                    ofType: "json") ?? ""
        self.animationView.animation = Animation.filepath(path)
        self.animationView.loopMode = .loop
        self.animationView.play()
    }
    
    @objc func handleDismiss(){
        self.endEditing(true)
        self.removeFromSuperview()
        self.animationView.stop()
        NotificationCenter.default.removeObserver(self, name: .removeAnimationView, object: nil)
    }
    
    
    

}
