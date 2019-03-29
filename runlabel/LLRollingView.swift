//
//  LLRollingView.swift
//  runLabel
//
//  Created by 刘 on 2018/11/7.
//  Copyright © 2018年 刘航. All rights reserved.
//

import UIKit

class LLRollingView: UIView {
    
    private var marqueeeTitle: String?
    private var mark1: CGRect?
    private var mark2: CGRect?
    private var isStop: Bool = false
    private var timeInterval: TimeInterval?
    
    convenience init(frame: CGRect,title: String,textColor: UIColor){
        self.init(frame: frame)
        marqueeeTitle = "\(title) "
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = true
        timeInterval = TimeInterval.init((marqueeeTitle?.lengthOfBytes(using: String.Encoding.utf8))!/5)

        let label = UILabel()
        label.frame = CGRect()
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = marqueeeTitle
        label.backgroundColor = UIColor.clear
        self.addSubview(label)
//        计算textLabel的大小
        let sizeOfText = label.sizeThatFits(CGSize.zero)
        mark1 = CGRect(x: 0, y: 0, width: sizeOfText.width, height: self.bounds.height)
        mark2 = CGRect(x: (mark1?.origin.x)! + (mark1?.size.width)!, y: 0, width: sizeOfText.width, height: self.bounds.height)
        label.frame = mark1!
        
        let userReserve = sizeOfText.width > frame.size.width ? true : false
        
       
        if userReserve == true {
            let reserveTextLb = UILabel()
            self.addSubview(reserveTextLb)
            reserveTextLb.frame = mark2!
            reserveTextLb.font = UIFont.systemFont(ofSize: 14)
            reserveTextLb.text = marqueeeTitle
            reserveTextLb.textColor = textColor
            reserveTextLb.backgroundColor = UIColor.clear
            self.labAnimation()
        }
    }
    // 跑马灯效果/****/
    func labAnimation(){
        
        if !isStop {
            let lbindex0 = self.subviews[0]
            let lbindex1 = self.subviews[1]
            
            UIView.transition(with: self, duration: timeInterval!, options: UIViewAnimationOptions.curveLinear, animations: {
                lbindex0.frame = CGRect(x: -((self.mark1?.size.width)!), y: 0, width: (self.mark1?.size.width)!, height: (self.mark1?.size.height)!)
                lbindex1.frame = CGRect(x: lbindex0.frame.origin.x+(self.mark1?.size.width)!, y: 0, width: lbindex1.frame.size.width, height: lbindex1.frame.size.height)
                
            }, completion: { (finish) in
                lbindex0.frame = self.mark2!
                lbindex1.frame = self.mark1!
                self.exchangeSubview(at: 0, withSubviewAt: 1)
                self.labAnimation()
            })
        }else{
            self.layer.removeAllAnimations()
        }
        
    }
    
    func start() {
        isStop = false
        let lbindex0 = self.subviews[0]
        let lbindex1 = self.subviews[1]
        
        lbindex0.frame = mark2!
        lbindex1.frame = mark1!
        
        self.exchangeSubview(at: 0, withSubviewAt: 1)
        self.labAnimation()
        
    }
    
    func stop(){
        isStop = true
        self.labAnimation()
    }
    
}
