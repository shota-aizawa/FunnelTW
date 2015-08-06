//
//  MainTabBarController.swift
//  FunnelTW
//
//  Created by 相澤渉太 on 2015/08/01.
//  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    var timelineView: FirstViewController!
    var funnelView: SecondViewController!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineView = FirstViewController()
        funnelView = SecondViewController()
        timelineView.tabBarItem = UITabBarItem(title: "MyTweet", image: UIImage(named: "TabBarIcon-01.png") , tag: 1)
        funnelView.tabBarItem = UITabBarItem(title: "MyFunnel", image: UIImage(named: "TabBarIcon-02.png") , tag: 2)
        
        var timelineNavigationController = UINavigationController(rootViewController: timelineView)
        var funnelNavigationController = UINavigationController(rootViewController: funnelView)
        self.setViewControllers([timelineNavigationController, funnelNavigationController], animated: false)
        
        UITabBar.appearance().barTintColor = UIColor(red: 199/255, green: 229/255, blue: 250/255, alpha: 1.0)
        
        
        
               
        
    }
    
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
