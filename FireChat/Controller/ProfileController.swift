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

protocol ProfileControllerDelegate: class {
    func handleLogout()
}

class ProfileController: UITableViewController {
    // MARK: - Properties
    weak var delegate: ProfileControllerDelegate?
    private var user: User? {
        didSet {
            headerView.user = user
        }
    }
    
    private lazy var headerView = ProfileHeader(frame: .init(x: 0, y: 0, width: view.frame.width, height: 380))
    
    private let footerView = ProfileFooter()
    
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
        showLoader(true)
        Service.fetchUser(withUid: uid) { (user) in
            self.showLoader(false)
            self.user = user
        }
    }
    
    // MARK: - Helpers
    func configrueUI() {
        tableView.tableHeaderView = headerView
        tableView.register(ProfileCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.contentInsetAdjustmentBehavior = .never
        headerView.delegate = self
        tableView.rowHeight = 64
        tableView.backgroundColor = .systemGroupedBackground
        
        footerView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 100)
        tableView.tableFooterView = footerView
        
        footerView.delegate = self
    }
    
    // MARK: - Selectors
    
    
}

// MARK: - Tableview delegate methods
extension ProfileController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileViewModel.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProfileCell
        let viewModel = ProfileViewModel(rawValue: indexPath.row)
        cell.viewModel = viewModel
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = ProfileViewModel(rawValue: indexPath.row) else { return }
        print(viewModel.description)
    }
}

// MARK: - Custom Protocol Methods
extension ProfileController: ProfileHeaderDelegate {
    func dismissController() {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileController: ProfileFooterDelegate {
    func handleLogout() {
        let alert = UIAlertController(title: nil, message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
            self.dismiss(animated: true) {
                self.delegate?.handleLogout()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
