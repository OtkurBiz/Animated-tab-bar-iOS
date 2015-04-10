//
//  ViewController.swift
//  EYTabBar
//
//  Created by Ezimet Yusup on 4/6/15.
//  Copyright (c) 2015 ww.otkur.biz. All rights reserved.


import UIKit

class ViewController: UIViewController {
    var tabbar:EYTabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let push:UIButton = UIButton(frame: CGRectMake(200, 200, 60, 60))
        push.setTitle("push", forState: UIControlState.Normal)
        push.addTarget(self, action: "push:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(push)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func push(sender:AnyObject){
        let controller:vv = vv()
        controller.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.pushViewController(controller, animated: true)
     
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
         self.tabBarController?.tabBar.hidden = true
         tabbar = self.tabBarController as? EYTabBar
         tabbar?.hideTabBar()
    }
 
    
}

