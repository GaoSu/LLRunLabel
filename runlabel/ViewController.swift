//
//  ViewController.swift
//  runlabel
//
//  Created by yons on 2018/11/7.
//  Copyright © 2018年 Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 50, y:50 , width: 100, height: 45)
        let runView = LLRollingView.init(frame:rect , title: "认真对待每一天，心平气和才能做好事情", textColor: UIColor.blue)
        view.addSubview(runView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

