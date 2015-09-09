//
//  QShapeLayer.swift
//  Ordersmoke
//
//  Created by qzp on 15/9/9.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

import UIKit

class QShapeLayer: CAShapeLayer {
    
    init(frame: CGRect) {
        super.init()
        self.frame = frame
        initializeUserInterface()
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func initializeUserInterface() {
           self.frame = CGRectMake(0, 0, frame.height, frame.height)
        let startAngle = -M_PI_2
        let endAngle = M_PI * 2 - M_PI_2
        self.path = UIBezierPath(arcCenter: CGPointMake(self.bounds.midX, self.bounds.midY), radius: frame.height/4, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true).CGPath
        self.fillColor = nil
        self.strokeColor = UIColor.whiteColor().CGColor
        self.lineWidth = 1
        //结束位置
        self.strokeEnd = 0.5
        //开始位置
        self.strokeStart = 0
        self.hidden = true
     }
    func startAnimation() {
        self.hidden = false
        //创建一个旋转动画
        //指定z轴，就是围绕着中心点旋转
        //transform 改变 rotation 旋转
        let baseAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        //旋转360度 0 - 2pi
        //初始位置
        baseAnimation.fromValue = 0
        //结束位置
        baseAnimation.toValue = M_PI * 2
        //执行时间
        baseAnimation.duration = 0.4
        //重复次数 .无限大
        baseAnimation.repeatCount = MAXFLOAT
        //显示方式 . 此处设置为线性
        baseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        //用CABasicAnimation执行动画，在动画结束后会回归动画开始前的状态。想要解决的话，必须设置“removedOnCompletion”和“fillMode”这两个属性。
        //kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态
        baseAnimation.removedOnCompletion = false
        baseAnimation.fillMode = kCAFillModeForwards
        self.addAnimation(baseAnimation, forKey: baseAnimation.keyPath)
        
    }
    
    func stopAnimation() {
        self.hidden = true
        
        self.removeAllAnimations()
        
    }

}
