//
//  SpeechRoles.swift
//  SwiftDemo
//
//  Created by 中行讯 on 2018/7/9.
//  Copyright © 2018年 Beijing CIC Technology Co., Ltd. All rights reserved.
//

import AVFoundation

class SpeechRoles {
    let synthesizer : AVSpeechSynthesizer
    private let voices : [AVSpeechSynthesisVoice]
    private let speechStrings : [String]
    
    init() {
        synthesizer = AVSpeechSynthesizer()
        /// 声音数组
        voices = [
            AVSpeechSynthesisVoice(language: "en-US"),
            AVSpeechSynthesisVoice(language: "en-GB")
            ] as! [AVSpeechSynthesisVoice]
        
        speechStrings = [
            "Hello AV Foundation. How are you?",
            "I'm well! Thanks for asking.",
            "Are you excited about the book?",
            "Very! I have always felt so misunderstood.",
            "What's your favorite feature?",
            "Oh, they're all my babies.  I couldn't possibly choose.",
            "It was great to speak with you!",
            "The pleasure was all mine!  Have fun!"
        ]
    }
    
    func beginConversation() {
        for item in 0..<speechStrings.count {
            let utterance : AVSpeechUtterance = AVSpeechUtterance(string: speechStrings[item])
            utterance.voice = voices[item % 2]
            /// 明确将要播放u语音内容的速率 范围是0.0 - 1.0
            utterance.rate = 0.5
            /// 播放特定于巨时候改变声音的语调 一般介于 0.5（低音） - 2.0（高音）
            utterance.pitchMultiplier = 0.8
            /// 语音合成其在播放下一句之前有段时间的停顿或者暂停
            utterance.postUtteranceDelay = 0.1
            synthesizer.speak(utterance)
        }
    }
    
    func endConversation() {
        //// 可以立即结束 可以读完当前单词停止
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    
    deinit {
        print("My is SpeechRoles , I dellloc .......")
    }
}
