//
//  Message.swift
//  FireChat
//
//  Created by William Yeung on 5/19/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation
import Firebase

struct Message {
    let text: String
    let toId: String
    let fromId: String
    var timestamp: Timestamp!
    var user: User?
    
    let isFromCurrentUser: Bool
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"]  as? String ?? ""
        self.toId = dictionary["toId"]  as? String ?? ""
        self.fromId = dictionary["fromId"]  as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
    }
}
