//
//  ViewController.swift
//  HRSegmentedControl
//
//  Created by MacBook Pro on 08/02/2016.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let segment = HRCustomSegment(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 50), items: ["1","2","3","4","5","6","7","8","9"])
        self.view.addSubview(segment)
        
        segment.segmentDidTap { (val) -> Void in
            
            print("selected value::: \(val)")
            
        }
    }


}

