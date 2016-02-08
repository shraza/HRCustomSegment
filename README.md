# HRCustomSegment

      let segment = HRCustomSegment(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 50), items: ["1","2","3","4","5","6","7","8","9"])
        self.view.addSubview(segment)
        
        segment.segmentDidTap { (val) -> Void in
            
            print("selected value::: \(val)")
            
        }

![screen shot 2016-02-08 at 11 34 33 pm](https://cloud.githubusercontent.com/assets/12963167/12895259/50ab4a8c-cebd-11e5-9e37-7ed64491cf51.png)
