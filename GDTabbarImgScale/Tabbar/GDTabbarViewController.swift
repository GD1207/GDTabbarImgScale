//
//  GDTabbarViewController.swift
//  GDTabbarImgScale
//
//  Created by 郭达 on 2018/10/11.
//  Copyright © 2018 DouNiu. All rights reserved.
//

import UIKit
let blackColor = RGBColor(123, g: 123, b: 123)
let mainColor = RGBColor(26, g: 178, b: 10)
public func RGBColor(_ r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha:1)
}


class GDTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let gdtab = GDTabbar()
        setValue(gdtab, forKey: "tabBar")
        
        let homeVC = GDHomeViewController();
        
        let moreVC = GDMoreViewController();

        let mineVC = GDMineViewController();
        
        addChildVC(homeVC, title: "首页", imgName: "tabbar_mainframe", selectedImgName: "tabbar_mainframeHL")
        addChildVC(moreVC, title: "内容", imgName: "tabbar_mainframe", selectedImgName: "tabbar_mainframeHL")
        addChildVC(mineVC, title: "我的", imgName: "tabbar_me", selectedImgName: "tabbar_meHL")
        
    }

    
    func addChildVC(_ vc:UIViewController,title:String,imgName:String,selectedImgName:String) {
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imgName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage.init(named: selectedImgName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:blackColor,
                                               NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: UIControlState())
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:mainColor,
                                               NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .selected)
        let nav = GDNavigationViewController(rootViewController: vc)
        addChildViewController(nav)
        
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
