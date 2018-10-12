//
//  GDTabbar.swift
//  GDTabbarImgScale
//
//  Created by 郭达 on 2018/10/11.
//  Copyright © 2018 DouNiu. All rights reserved.
//

import UIKit

class GDTabbar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        for tabbarButton in subviews {
            if NSStringFromClass(tabbarButton.classForCoder) == "UITabBarButton"{
                
                let ctr = tabbarButton as! UIControl
                ctr.addTarget(self, action: #selector(GDTabbar.barButtonAction(sender:)), for: .touchUpInside)
            }
        }
        
    }
    
    @objc func barButtonAction(sender: UIControl) {
        for imageView in sender.subviews {
            if NSStringFromClass(imageView.classForCoder) == "UITabBarSwappableImageView" {
                tabBarAnimationWithView(view: imageView)
            }
        }
    }
    
    @objc func tabBarAnimationWithView(view:UIView){
        let scaleAnimation = CAKeyframeAnimation()
        scaleAnimation.keyPath = "transform.scale"
        scaleAnimation.values = [1.0,1.4,0.9,1.15,0.95,1.05,1.0]
        scaleAnimation.duration = 0.3
        scaleAnimation.calculationMode = kCAAnimationCubic
        scaleAnimation.repeatCount = 1
        view.layer.add(scaleAnimation, forKey: "123")
    }

}
