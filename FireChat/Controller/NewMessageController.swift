//
//  NewMessageController.swift
//  FireChat
//
//  Created by William Yeung on 5/18/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class NewMessageController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .systemPink
    }
}
