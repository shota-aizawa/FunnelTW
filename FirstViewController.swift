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
        
        prototypeCell = TWTRTweetTableViewCell(style: .Default, reuseIdentifier: "Cell")
        tableView.registerClass(TWTRTweetTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
        
        
        loadUserTL()
        
        // Do any additional setup after loading the view, typically from a nib.
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TWTRTweetTableViewCell
        
        let tweet = tweets[indexPath.row]
        cell.configureWithTweet(tweet)
        
        return cell
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let tweet = tweets[indexPath.row]
        prototypeCell?.configureWithTweet(tweet)
        return TWTRTweetTableViewCell.heightForTweet(tweet, width: self.view.bounds.width)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
