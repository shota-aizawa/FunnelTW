//
//  FirstViewController.swift
//  FunnelTW
//
//  Created by 相澤渉太 on 2015/08/01.
//  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
//

import UIKit
import TwitterKit


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var tableView:UITableView!
    var rightUtilityButtons:NSMutableArray = []
    var leftUtilityButtons:NSMutableArray = []
    
    func rightButtons(){
    }
    
    func leftButtons(){
    }
    
    var tweets: [TWTRTweet] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var prototypeCell: TWTRTweetTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "MyTimeLine"
        
        tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        
        prototypeCell = TWTRTweetTableViewCell(style: .Default, reuseIdentifier: "cell")
        tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        
        // nav right item button
        var settingBtn:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        settingBtn.addTarget(self, action: "onClickSetting", forControlEvents: UIControlEvents.TouchUpInside)
        settingBtn.frame = CGRectMake(0, 0, 30, 30)
        settingBtn.setImage(UIImage(named: "FunnelSetting.png"), forState: .Normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingBtn)

        
        
        
        
        
        
        loadUserTL()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func onClickSetting() {
        let settingViewCtrl = SettingViewController()
        let modalView = UINavigationController(rootViewController: settingViewCtrl)
        modalView.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        self.presentViewController(modalView, animated: true, completion: nil)
    }
    
    
    
    
    // UserTL
    
    func loadUserTL(){
        var params = ["result_type": "mixed"]
        TwitterAPI.getUserTL(params, tweets:{
            twttrs in
            for tweet in twttrs {
                self.tweets.append(tweet)
            }
            }, error: {
                error in
                println(error.localizedDescription)
        })
    }
    
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? TWTRTweetTableViewCell
        
//        if (cell == nil ) {
//            cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? SWTableViewCell
//            cell = SWTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
//            
//            
//            rightUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1.0), title: "More")
//            rightUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 1.0, green: 0.23, blue: 0.188, alpha: 1.0), title: "Delete")
//        
//            
//            leftUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 0.07, green: 0.75, blue: 0.16, alpha: 1.0), title: "Plan")
//            leftUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 1.0, green: 1.0, blue: 0.35, alpha: 1.0), title: "Do")
//            leftUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 1.0, green: 0.23, blue: 0.188, alpha: 1.0), title: "Check")
//            leftUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 0.55, green: 0.27, blue: 0.07, alpha: 1.0), title: "Action")
//            
//            
//            cell.leftUtilityButtons = self.leftUtilityButtons
//            cell.rightUtilityButtons = self.rightUtilityButtons
//            cell.delegate = self
//        }
        
        let tweet = tweets[indexPath.row]
        
        cell!.configureWithTweet(tweet)
        return cell!
    }
    
   
    
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let tweet = tweets[indexPath.row]
        prototypeCell?.configureWithTweet(tweet)
        return TWTRTweetTableViewCell.heightForTweet(tweet, width: self.view.bounds.width)
        
    }

    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        
        
        let funnelOne = UITableViewRowAction(style: .Normal, title: "Delete") {
            (action, indexPath)  in
            
            self.tweets.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            
            
        }
        
        let funnelTwo = UITableViewRowAction(style: .Default, title: "Delete") {
                (action, indexPath) in
                
                self.tweets.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            }
        
        let funnelThree = UITableViewRowAction(style: .Default, title: "Delete") {
            (action, indexPath) in
            
            self.tweets.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
        
        let funnelFour = UITableViewRowAction(style: .Default, title: "Delete") {
            (action, indexPath) in
            
            self.tweets.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
        
        
        funnelOne.backgroundColor = UIColor(red:113/255, green:252/255, blue:235/255, alpha:1.0)
        funnelTwo.backgroundColor = UIColor(red:255/255, green:250/255, blue:102/255, alpha:1.0)
        funnelThree.backgroundColor = UIColor(red:250/255, green:151/255, blue:149/255, alpha:1.0)
        funnelFour.backgroundColor = UIColor(red:172/255, green:123/255, blue:51/255, alpha:1.0)
        
    
        
        
        return [funnelOne, funnelTwo, funnelThree, funnelFour]
    
    }
        
        func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            return true
        }
        
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
        func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
            let tmp = tweets[sourceIndexPath.row]
            tweets.removeAtIndex(sourceIndexPath.row)
            tweets.insert(tmp, atIndex: destinationIndexPath.row)
        }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    
    }

