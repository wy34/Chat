//
//  ConversationsController.swift
//  FireChat
//
//  Created by William Yeung on 5/15/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class ConversationsController: UIViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func showProfile() {
        
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile))
    }
}
