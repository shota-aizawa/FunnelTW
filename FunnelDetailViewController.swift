//
//  FunnelDetailViewController.swift
//  FunnelTW
//
//  Created by 相澤渉太 on 2015/08/04.
//  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
//

import UIKit

class FunnelDetailViewController: UIViewController, senderDelegate {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "messageSegue"{
            var secondVC: SecondViewController = segue.destinationViewController as! SecondViewController
            secondVC.delegate = self
        }
    }

    func receiveMessage(message: NSString){
        
        var transFunneltag:Int = message.integerValue
        
        switch transFunneltag {
        case 1:
            funnelTag = 1
        case 2:
            funnelTag = 2
        case 3:
            funnelTag = 3
        case 4:
            funnelTag = 4
        default:
            break
        }
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch funnelTag{
        
        case 1:
            self.view.backgroundColor = UIColor.greenColor()
        case 2:
            self.view.backgroundColor = UIColor.yellowColor()
        case 3:
            self.view.backgroundColor = UIColor.redColor()
        case 4:
            self.view.backgroundColor = UIColor.brownColor()
        default:
            break
        }
        

        // Do any additional setup after loading the view.
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
