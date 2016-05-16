//
//  JFQdaojishi.swift
//  jifenqi-shujuku
//
//  Created by hqq1 on 16/5/16.
//  Copyright © 2016年 hqq1. All rights reserved.
//

import Foundation
import UIKit
enum CountTextType {
    case JFQTextTypeScale
    case JFQTextTypeRotate
}

class JFQTextField: UITextField {
    //    倒计时的Label
    func addLabel() {
        timeLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))
        timeLabel.backgroundColor = UIColor.clearColor()
        timeLabel.font = UIFont.systemFontOfSize(17.0)
        timeLabel.textAlignment = NSTextAlignment.Center
        timeLabel.text = "\(self.originNum)"
        self.addSubview(timeLabel)
        
    }
    
    //    开启定时器
    func startCountDown() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("countDown"), userInfo: nil, repeats: true)
        //        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Disabled)
        self.enabled = false
        
        print("pass")
    }
    
    //    倒计时开始
    func countDown() {
        self.startCount--
        timeLabel.text = "\(self.startCount)"
        
        //倒计时完成后停止定时器，移除动画
        if self.startCount < 0 {
            if self.timer == nil {
                return
            }
        }
        
    }
    
    
    
}

