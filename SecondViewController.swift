//
//  SecondViewController.swift
//  FunnelTW
//
//  Created by 相澤渉太 on 2015/08/01.
//  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
//

import UIKit
import TwitterKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "MyFunnel"
        
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        let BGColor = UIColor(red:1.0, green:1.0, blue:0.0, alpha:0.8)
        
        
        
        var funnelDraw = FunnelView(frame: CGRectMake(20, 20, screenWidth-40, screenHeight-40))
        funnelDraw.backgroundColor = BGColor
        self.view.addSubview(funnelDraw)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
