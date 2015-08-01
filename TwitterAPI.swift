//
//  TwitterAPI.swift
//  FunnelTW
//
//  Created by 相澤渉太 on 2015/08/01.
//  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
//

import Foundation
import TwitterKit


class TwitterAPI {
    let  baseURL = "https://api.twitter.com"
    let version = "/1.1"
    
    init(){
        
    }
    
    
    class var sharedInstance : TwitterAPI {
        struct Static {
            static let instance : TwitterAPI = TwitterAPI()
        }
        return Static.instance
    }
    
    // get userTL
    class func getUserTL(params: [NSObject : AnyObject]!, tweets: [TWTRTweet]->(), error: (NSError) -> ()){
        let api = self.sharedInstance
        var clientError: NSError?
        let path = "/statuses/user_timeline.json"
        let endpoint = api.baseURL + api.version + path
        var params = Dictionary<String, String>()
        
        let request = Twitter.sharedInstance().APIClient.URLRequestWithMethod(
            "GET",
            URL: endpoint,
            parameters: params,
            error: &clientError
        )
        
        Twitter.sharedInstance().APIClient.sendTwitterRequest(request, completion: {
            response, data, err in
            if err == nil {
                var jsonError: NSError?
                let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: &jsonError)
                if let jsonArray = json as? NSArray {
                    tweets(TWTRTweet.tweetsWithJSONArray(jsonArray as [AnyObject]) as! [TWTRTweet])
                }
            } else {
                error(err!)
            }
        })
        
        
    }
    
    
}

