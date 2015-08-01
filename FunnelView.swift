//
//  FunnelView.swift
//  FunnelTW
//
//  Created by 相澤渉太 on 2015/08/01.
//  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
//

import UIKit

class FunnelView: UIView {
    
    // Only override drawRect: if you perform custom drawing.
    
    let circleLUColor = UIColor(red:1.0, green:0.0, blue:0.0, alpha:0.8)
    let circleRUColor = UIColor(red:0.0, green:1.0, blue:0.0, alpha:0.8)
    let circleLDColor = UIColor(red:0.0, green:1.0, blue:0.0, alpha:0.8)
    let circleRDColor = UIColor(red:0.0, green:1.0, blue:0.0, alpha:0.8)
    
    override func drawRect(rect: CGRect) {
        
        var circleLUBtn: UIButton = UIButton(frame: CGRectMake(40, 100, 100, 100))
        var circleRUBtn: UIButton = UIButton(frame: CGRectMake(160, 100, 100, 100))
        var circleLDBtn: UIButton = UIButton(frame: CGRectMake(40, 250, 100, 100))
        var circleRDBtn: UIButton = UIButton(frame: CGRectMake(160, 250, 100, 100))
        
        
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
        
        
        //        restBtn.addTarget(self, action: "onClickResetReadData", forControlEvents: UIControlEvents.TouchUpInside)
        //
        
        addSubview(circleLUBtn)
        addSubview(circleRUBtn)
        addSubview(circleLDBtn)
        addSubview(circleRDBtn)
        
        
    }
    
    
}
