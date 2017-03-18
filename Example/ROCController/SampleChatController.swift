//
//  ViewController.swift
//  ROCController
//
//  Created by mbalex99 on 03/17/2017.
//  Copyright (c) 2017 mbalex99. All rights reserved.
//

import UIKit
import ROCController
import RealmSwift

class SampleChatController: ROCBaseController<SampleChatMessage> {
    
    let conversation: Conversation
    
    init(conversation: Conversation){
        self.conversation = conversation
        let chatMessages = conversation.chatMessages.sorted(byKeyPath: "timestamp", ascending: true)
        super.init(results: chatMessages)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Now Chatting"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func sendButtonDidTap(text: String) {
        let sampleChatMessage = SampleChatMessage()
        sampleChatMessage.userId = SampleAppConstants.myUserId
        sampleChatMessage.text = text
        let realm = try! Realm()
        try! realm.write {
            conversation.chatMessages.append(sampleChatMessage)
        }
    }

}

