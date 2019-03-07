//
//  HelloAVFoundationController.swift
//  SwiftDemo
//
//  Created by 中行讯 on 2018/7/9.
//  Copyright © 2018年 Beijing CIC Technology Co., Ltd. All rights reserved.
//

import UIKit
import AVFoundation

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class HelloAVFoundationController: UITableViewController ,AVSpeechSynthesizerDelegate{

    var speechRoles: SpeechRoles?
    var speechStrings = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AV Foundation"
        tableView.separatorStyle = .none
        
        speechRoles = SpeechRoles()

        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 20.0, right: 0.0)
        speechRoles?.synthesizer.delegate = self
        speechRoles?.beginConversation()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        speechRoles?.endConversation()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return speechStrings.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = indexPath.row % 2 == 0 ? "YouCell" : "AVFCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            cell?.selectionStyle = .none
        }else{
            for cellView in (cell?.subviews)! {
                cellView.removeFromSuperview()
            }
        }
        
        let message = speechStrings[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            //自己
            let photo = UIImageView(frame: CGRect(x: self.view.bounds.size.width - 60, y: 10, width: 50, height: 50))
            cell?.addSubview(photo)
            photo.image = UIImage(named: "photo")
            cell?.addSubview(bubbleView(text: message, fromsSelf: true, position: 65))
        }else{
            //电脑
            let photo = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
            cell?.addSubview(photo)
            photo.image = UIImage(named: "photo")
            cell?.addSubview(bubbleView(text: message, fromsSelf: false, position: 65))
        }

        return cell!
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let message : String = speechStrings[indexPath.row]
        let H = message.getNormalStrH(str: message, strFont: 14.0, w: 180.0)
        return H.height+88
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        speechStrings.append(utterance.speechString)
        tableView.reloadData()
        let indexPath = IndexPath(row: speechStrings.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

    func bubbleView(text: String, fromsSelf: Bool, position:Int) -> UIView {
        let font:UIFont = UIFont.systemFont(ofSize: 14.0)
        let size = text.getNormalStrH(str: text, strFont: 14.0, w: 180.0)
        let returnView = UIView(frame: CGRect.zero)
        returnView.backgroundColor = UIColor.clear
        
        let bubble = UIImage(named: fromsSelf ? "bubble_right" : "bubble_left")
        let bubbleImageView = UIImageView(image: bubble)
        
        let bubbleText = UILabel(frame: CGRect(x: fromsSelf ? 15.0 : 22.0, y: 20.0, width: size.width+10, height: size.height+10))
        bubbleText.backgroundColor = UIColor.clear
        bubbleText.font = font
        bubbleText.numberOfLines = 0
        bubbleText.lineBreakMode = .byCharWrapping
        bubbleText.text = text
        
        bubbleImageView.frame = CGRect(x: 0.0, y: 14.0, width: bubbleText.frame.size.width+30.0, height: bubbleText.frame.size.height+30.0)
        
        if fromsSelf {
            bubbleImageView.frame = CGRect(x: screenWidth - CGFloat(position) - (bubbleText.frame.size.width+30.0), y: 0.0, width: bubbleText.frame.size.width+30.0, height: bubbleText.frame.size.height+30.0)
        }else{
            returnView.frame = CGRect(x: CGFloat(position), y: CGFloat(0.0), width: bubbleText.frame.size.width+30.0, height: bubbleText.frame.size.height+30.0)
        }
        returnView.addSubview(bubbleImageView)
        bubbleImageView.addSubview(bubbleText)
        
        return returnView
    }
    
    deinit {
        speechRoles?.synthesizer.delegate = nil
        speechRoles = nil
        print("My name is HelloAVFoundationController , I delloc .......")
    }

}
