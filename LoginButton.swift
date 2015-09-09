//
//  LoginButton.swift
//  Ordersmoke
//
//  Created by qzp on 15/9/9.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    var durtion: NSTimeInterval = 0.2
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2
        self.clipsToBounds = true
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
        self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2
        self.clipsToBounds = true
    }
    lazy var lineLayer: QShapeLayer! = {
        let llayer = QShapeLayer(frame: self.bounds)
        self.layer.addSublayer(llayer)
        return llayer
        }()
    
    var cachedTitle: String?
    
    /**
    开始动画
    */
    func start() {
        self.cachedTitle = titleForState(.Normal)
        self.setTitle("", forState: .Normal)
        self.shrink()
   
        self.userInteractionEnabled = false
      lineLayer.startAnimation()
        
//        dispatch_after(when: dispatch_time(DISPATCH_TIME_NOW, Int64(0.02 * NSEC_PER_SEC), dispatch_get_main_queue(), { () -> Void in
//              self.lineLayer.startAnimation()
//        }))
        
//        let dispathTimeT = dispatch_time(DISPATCH_TIME_NOW, Int64(0.2 * NSEC_PER_SEC))
//        dispatch_after(dispathTimeT, dispatch_get_main_queue()) { () -> Void in
//            
//        }
    }
    
    ///结束
    func stop() {
     
        self.layer.removeAllAnimations()
        
//        self.expand()
        lineLayer.stopAnimation()
        self.userInteractionEnabled = true
        self.setTitle(self.cachedTitle, forState: .Normal)
    }
    
    func shrink() {
        let shrinkAnim = CABasicAnimation(keyPath: "bounds.size.width")
        shrinkAnim.fromValue = frame.width
        shrinkAnim.toValue = frame.height
        shrinkAnim.duration = durtion
        shrinkAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        shrinkAnim.fillMode = kCAFillModeForwards
        shrinkAnim.removedOnCompletion = false
        layer.addAnimation(shrinkAnim, forKey: shrinkAnim.keyPath)
        
    }

    func expand() {
        let expandAnim = CABasicAnimation(keyPath: "transform.scale")
        expandAnim.fromValue = 1.0
        expandAnim.toValue = 26.0
        expandAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.95, 0.02, 1, 0.05)
        expandAnim.duration = 0.3
        expandAnim.delegate = self
        expandAnim.fillMode = kCAFillModeForwards
        expandAnim.removedOnCompletion = false
        layer.addAnimation(expandAnim, forKey: expandAnim.keyPath)
    }

}
