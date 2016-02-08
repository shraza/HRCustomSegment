//
//  HRCustomSegment.swift
//  HRSegmentView
//
//  Created by MacBook Pro on 25/12/2015.
//  Copyright © 2015 MacBook Pro. All rights reserved.
//

import UIKit


class HRCustomSegment: UIView {
    
    var selectedButton:UIButton = UIButton()
    
    typealias Handler = (val:String) -> Void
    
    var myhandler:Handler?
    
    var contents:[String] = [String]() {
        didSet{
            let a = contents.sort { ($0 as NSString).intValue < ($1 as NSString).intValue  }
            self.contents = a
            setup()
        }
    }
    
     init(frame: CGRect,items:[String]) {
        super.init(frame: frame)
        
        self.contents = items
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup(){
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        let scrollView = UIScrollView(frame: frame)
        self.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        
        var x = 10
        let y = Int((self.frame.size.height - 35)/2)
        let xPadding = 10
        
        for val in contents {
            
            let btn = UIButton(type: UIButtonType.Custom)
            btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
            btn.frame = CGRect(x: x, y: y, width: 35, height: 35)
            btn.setTitle(val, forState: UIControlState.Normal)
            btn.layer.cornerRadius = 35/2;
            btn.clipsToBounds = true
            btn.addTarget(self, action: "btnTap:", forControlEvents: UIControlEvents.TouchUpInside)
            scrollView.addSubview(btn)
            
            x = x + 30 + xPadding
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(x), height: 35)
        
    }
    
    func btnTap(sender:UIButton)
    {
        if sender.layer.borderWidth == 1 {    /// selected
            
            deSelectButton(sender)
            myhandler!(val: "Any")
        }
        else if sender.layer.borderWidth == 0 {   /// unselected
            
            deSelectButton(selectedButton)
            selectButton(sender)
            selectedButton = sender
            myhandler!(val: sender.titleForState(.Normal)!)
        }
    }
    
    func selectButton(btn:UIButton)
    {
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.orangeColor().CGColor
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        btn.setNeedsDisplay()
    }
    
    func deSelectButton(btn:UIButton)
    {
        btn.layer.borderWidth = 0
        btn.layer.borderColor = UIColor.clearColor().CGColor
        btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        btn.setNeedsDisplay()
    }
    
    func segmentDidTap(completionHandler:Handler)
    {
        myhandler = completionHandler
    }
}
