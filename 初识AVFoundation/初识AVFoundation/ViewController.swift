//
//  ViewController.swift
//  初识AVFoundation
//
//  Created by zhonghangxun on 2019/3/7.
//  Copyright © 2019 wangxiangbo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var touchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        touchButton.layer.cornerRadius = 15.0
        title = "初识AVFoundation"
    }

    
    @IBAction func touchAction(_ sender: UIButton) {
        let hello = HelloAVFoundationController()
        self.navigationController?.pushViewController(hello, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /// 读出 "hello world"
//        let synthesizer = AVSpeechSynthesizer()
//        let utterance = AVSpeechUtterance(string: "胡涛 醒醒")
//        synthesizer.speak(utterance)
//        print("game over")
    }
    
}

