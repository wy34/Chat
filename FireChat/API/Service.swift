//
//  Service.swift
//  FireChat
//
//  Created by William Yeung on 5/18/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Service {    
    static func fetchUsers(completion: @escaping ([User]) -> Void) {
        var users: [User] = []
        
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({document in
                let data = document.data()
                let user = User(data: data)
                users.append(user)
            })
            completion(users)
        }
    }
}
