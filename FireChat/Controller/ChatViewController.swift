//
//  ChatViewController.swift
//  FireChat
//
//  Created by William Yeung on 5/19/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class ChatViewController: UICollectionViewController {
    // MARK: - Properties
    private let user: User
    
    // MARK: - Lifecycle
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        print("chat conroller \(user.username)")
    }
    
    // MARK: - Helpers
    func configureUI() {
        
    }
}
