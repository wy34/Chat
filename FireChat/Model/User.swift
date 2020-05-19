//
//  User.swift
//  FireChat
//
//  Created by William Yeung on 5/18/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

struct User {
    let uid: String
    let profileImageUrl: String
    let username: String
    let fullname: String
    let email: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.username = data["userName"] as? String ?? ""
        self.fullname = data["fullName"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
    }
}
