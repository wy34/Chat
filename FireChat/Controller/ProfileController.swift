//
//  ProfileController.swift
//  FireChat
//
//  Created by William Yeung on 5/25/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "profileCell"

class ProfileController: UITableViewController {
    // MARK: - Properties
    private var user: User? {
        didSet {
            headerView.user = user
        }
    }
    private lazy var headerView = ProfileHeader(frame: .init(x: 0, y: 0, width: view.frame.width, height: 380))
    
    
    
    // MARK: - Lifecyces
    override func viewDidLoad() {
        super.viewDidLoad()
        configrueUI()
        fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    // MARK: - Api
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Service.fetchUser(withUid: uid) { (user) in
            self.user = user
            print(user.username)
        }
    }
    
    // MARK: - Helpers
    func configrueUI() {
        tableView.backgroundColor = .white
        
        tableView.tableHeaderView = headerView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        headerView.delegate = self
    
    }
    
    // MARK: - Selectors
    
    
}


extension ProfileController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}


extension ProfileController: ProfileHeaderDelegate {
    func dismissController() {
        dismiss(animated: true, completion: nil)
    }
}
