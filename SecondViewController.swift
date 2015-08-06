//
//  SecondViewController.swift
//  FunnelTW
//
//  Created by 相澤渉太 on 2015/08/01.
//  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
//

import UIKit
import TwitterKit


@objc protocol senderDelegate{
    func receiveMessage(message:NSString)

}

 var funnelTag:Int = 0

class SecondViewController: UIViewController {
    
    weak var delegate: senderDelegate?
    var message = funnelTag.description
    
    
    func sendMessage(sender: AnyObject){
        delegate?.receiveMessage(message)
    }
    
    let circleLUColor = UIColor(red:113/255, green:252/255, blue:235/255, alpha:1.0)
    let circleRUColor = UIColor(red:255/255, green:250/255, blue:102/255, alpha:1.0)
    let circleLDColor = UIColor(red:250/255, green:151/255, blue:149/255, alpha:1.0)
    let circleRDColor = UIColor(red:172/255, green:123/255, blue:51/255, alpha:1.0)

    
    
    func onClick(){
        
        let funnedDetailViewController = FunnelDetailViewController()
        self.navigationController?.pushViewController(funnedDetailViewController, animated: false)
        
    }

    func tapped(sender: UIButton){
        switch sender.tag{
        case 1:
            funnelTag = 1
        case 2:
            funnelTag = 2
        case 3:
            funnelTag = 3
        case 4:
            funnelTag = 4
        default:
            funnelTag = 0
            break
        }
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationItem.title = "MyFunnel"
        
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        let BGColor = UIColor(red:255, green:255, blue:255, alpha:1.0)
        
        
        var funnelDraw = FunnelView(frame: CGRectMake(20, 20, screenWidth-40, screenHeight-40))
        funnelDraw.backgroundColor = BGColor
        self.view.addSubview(funnelDraw)
        
        let circleLUBtn = UIButton(frame: CGRectMake(40, 100, 100, 100))
        let circleRUBtn = UIButton(frame: CGRectMake(180, 100, 100, 100))
        let circleLDBtn = UIButton(frame: CGRectMake(40, 250, 100, 100))
        let circleRDBtn = UIButton(frame: CGRectMake(180, 250, 100, 100))
        
        circleLUBtn.tag = 1
        circleRUBtn.tag = 2
        circleLDBtn.tag = 3
        circleRDBtn.tag = 4
        
        circleLUBtn.setTitle("", forState: UIControlState.Normal)
        circleRUBtn.setTitle("", forState: UIControlState.Normal)
        circleLDBtn.setTitle("", forState: UIControlState.Normal)
        circleRDBtn.setTitle("", forState: UIControlState.Normal)
        
        circleLUBtn.backgroundColor = circleLUColor
        circleRUBtn.backgroundColor = circleRUColor
        circleLDBtn.backgroundColor = circleLDColor
        circleRDBtn.backgroundColor = circleRDColor
        
        circleLUBtn.layer.cornerRadius = 50
        circleRUBtn.layer.cornerRadius = 50
        circleLDBtn.layer.cornerRadius = 50
        circleRDBtn.layer.cornerRadius = 50
        
        
        circleLUBtn.addTarget(self, action: "onClick", forControlEvents: UIControlEvents.TouchUpInside)
        circleRUBtn.addTarget(self, action: "onClick", forControlEvents: UIControlEvents.TouchUpInside)
        circleLDBtn.addTarget(self, action: "onClick", forControlEvents: UIControlEvents.TouchUpInside)
        circleRDBtn.addTarget(self, action: "onClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        circleLUBtn.addTarget(self, action: "tapped", forControlEvents: UIControlEvents.ValueChanged)
        circleRUBtn.addTarget(self, action: "tapped", forControlEvents: UIControlEvents.ValueChanged)
        circleLDBtn.addTarget(self, action: "tapped", forControlEvents: UIControlEvents.ValueChanged)
        circleRDBtn.addTarget(self, action: "tapped", forControlEvents: UIControlEvents.ValueChanged)
        
        
        self.view.addSubview(circleLUBtn)
        self.view.addSubview(circleRUBtn)
        self.view.addSubview(circleLDBtn)
        self.view.addSubview(circleRDBtn)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
