//
//  ViewController.swift
//  EYTabBar
//
//  Created by Ezimet Yusup on 4/6/15.
//  Copyright (c) 2015 ww.otkur.biz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tabbar:EYTabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
       // tabbar = self.tabBarController as? EYTabBar
        let push:UIButton = UIButton(frame: CGRectMake(200, 200, 60, 60))
        push.setTitle("push", forState: UIControlState.Normal)
        push.addTarget(self, action: "push:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(push)
    }

//    override func viewDidAppear(animated: Bool) {
//        println(self.tabBarController)
//        tabbar = self.tabBarController as? EYTabBar
//        tabbar.showTabBar()
//    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func push(sender:AnyObject){
        let controller:vv = vv()
        controller.view.backgroundColor = UIColor.yellowColor()
        //var TabBar:EYTabBar =  controller.tabBarController as EYTabBar
       // controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
       // self.navigationController?.hidesBottomBarWhenPushed = true
    }
    
    override func viewWillAppear(animated: Bool) {
        tabbar = self.tabBarController as? EYTabBar
        tabbar?.showTabBar()
    }
    

}
class vv:UIViewController{
     var tabbar:EYTabBar?
    override func viewDidLoad() {
        super.viewDidLoad()
          //println(self.tabBarController)
            self.tabBarController?.tabBar.hidden = true
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         println(self.tabBarController)
         //self.navigationController?.tabBarController?.hidesBottomBarWhenPushed = true
         self.tabBarController?.tabBar.hidden = true
        tabbar = self.tabBarController as? EYTabBar
        tabbar?.hideTabBar()
    }
    override func viewDidAppear(animated: Bool) {
        
    }
    
}

