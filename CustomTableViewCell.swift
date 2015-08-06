//
//  CustomTableViewCell.swift
//  FunnelTW
//
//  Created by 相澤渉太 on 2015/08/01.
//  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
//

import UIKit
import TwitterKit



@objc protocol CustomTableViewCellDelegate {
    optional func delTweet(cell: CustomTableViewCell)
}

class CustomTableViewCell: TWTRTweetTableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    var haveButtonsDisplayed = false
    
    func deleteTweet() {
        delegate?.delTweet?(self)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .None
        let swipeRight = UISwipeGestureRecognizer()
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.addGestureRecognizer(swipeRight)
        swipeRight.addTarget(self, action: "onRightSwipe")
//        self.contentView.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: "onRightSwipe"))
//        
        
        
        
//        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: "onLeftSwipe")
//        swipeRecognizer.direction = .Left
//        self.contentView.addGestureRecognizer(swipeRecognizer)
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func createview(){
        self.contentView.backgroundColor = UIColor.redColor()
        self.backgroundView = UIView(frame: self.bounds)
    }
    
//    func onLeftSwipe(){
//        self.backgroundView?.backgroundColor = UIColor.whiteColor()
//        UIView.animateWithDuration(0.1,animations:{
//            let size = self.contentView.frame.size
//            let origin = self.contentView.frame.origin
//            self.contentView.frame = CGRect(x:origin.x - 100, y:origin.y, width:size.width, height:size.height)
//            }) { completed in
//                if self.contentView.frame.origin.x == -100 {
//                    self.delegate?.readTweet?(self)
//                    }
//            }
//    }
//    
//    func moveToLeft() {
//        let size   = self.contentView.frame.size
//        let origin = self.contentView.frame.origin
//        self.contentView.frame = CGRect(x: origin.x - 100, y:origin.y, width:size.width, height:size.height)
//    }
//
    func onRightSwipe() {
        
        UIView.animateWithDuration(0.7, animations: {
            let size   = self.contentView.frame.size
            let origin = self.contentView.frame.origin
            self.contentView.frame = CGRect(x: origin.x + 350, y:origin.y, width:size.width, height:size.height)
            }) { completed in
                if self.contentView.frame.origin.x == 350 {
                    self.delegate?.delTweet?(self)
                }
        }
        self.backgroundColor = UIColor(red:113/255, green:122/255, blue:252/255, alpha:1.0)
        
        
    }

    func moveToRight() {
        let size   = self.contentView.frame.size
        let origin = self.contentView.frame.origin
        self.contentView.frame = CGRect(x: origin.x + 100, y:origin.y, width:size.width, height:size.height)
    }

    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

//         Configure the view for the selected state
//    }

}
