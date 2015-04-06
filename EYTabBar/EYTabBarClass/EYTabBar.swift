//
//  EYTabBar.swift
//  EYTabBar
//
//  Created by Ezimet Yusup on 4/6/15.
//  Copyright (c) 2015 ww.otkur.biz. All rights reserved.
//

import Foundation
import UIKit
class EYTabBar: UITabBarController {
    private var count:Int=0
    var EYTabbarView:UIView!
    var selectedView:UIView!
    private var tabBarImages:NSArray = []
    var barHeight:CGFloat = 50
    var AnimationDuration:NSTimeInterval = 0.38
    var SpringDamping:CGFloat = 0.7
    var SpringVelocity:CGFloat = 0.6
    private var unitWidth:CGFloat!
       let height:CGFloat = UIScreen.mainScreen().bounds.height
    override  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override private init() {
        super.init()
        
    }
    required internal init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(icons:NSArray){
        super.init()
        tabBarImages = icons
        count = icons.count
        initCustomTabBar()
        initViews()
    }
    
    func initCustomTabBar(){
     
        EYTabbarView = UIView(frame: CGRectMake(0, height-barHeight, self.view.frame.width, barHeight))
       // EYTabbarView = UIView(frame: CGRectMake(0,0, self.view.frame.width, self.tabBar.frame.height))
        EYTabbarView.backgroundColor =  UIColor(red: 67/255.0, green: 74/255.0, blue: 84/255.0, alpha: 1.0)
        self.tabBar.userInteractionEnabled = false
        //self.tabBar.delegate = nil
        // self.tabBar.userActivity = false
       // self.tabBar.addSubview(EYTabbarView)
        self.view.addSubview(EYTabbarView)
    }
    
    func initViews(){
        unitWidth = EYTabbarView.frame.width/CGFloat(count)
        
        selectedView = UIView(frame: CGRectMake(0, 0, unitWidth, barHeight))
        selectedView.backgroundColor = UIColor(red:0, green: 0, blue: 0, alpha: 0.3)
        
        EYTabbarView.addSubview(selectedView)
        
        for(var i=0;i<count;i++){
            let imgName:String = tabBarImages[i] as String
            let img:UIImage = UIImage(named: imgName)!
            let x:CGFloat = CGFloat(i)*unitWidth
            var button:UIButton = UIButton(frame: CGRectMake(x, 0, unitWidth, barHeight))
            //button.buttonType = UIButtonType.Custom.hashValue
            button.setImage(img, forState: UIControlState.Normal)
            button.tag = i
            button.addTarget(self, action: "selectTab:", forControlEvents: UIControlEvents.TouchUpInside)
            self.EYTabbarView.addSubview(button)
        }
        
    }
    
    
    
    func selectTab(button:UIButton){
        self.selectedIndex = button.tag
        UIView.animateWithDuration(AnimationDuration, delay: 0, usingSpringWithDamping: SpringDamping, initialSpringVelocity: SpringVelocity, options: nil, animations: { () -> Void in
            self.selectedView.frame.origin.x = CGFloat(button.tag)*self.unitWidth
            }, completion: nil)
    }
    
    
    func showTabBar(){
        //EYTabbarView.frame.size.height = barHeight
       EYTabbarView.frame.origin.y = height-barHeight
    }
    
    func hideTabBar(){
      //   EYTabbarView.frame.size.height = 0
        EYTabbarView.frame.origin.y += barHeight
        
    }
    
    
    
    
    
    
}