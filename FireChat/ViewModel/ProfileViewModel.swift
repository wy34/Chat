//
//  ProfileViewModel.swift
//  FireChat
//
//  Created by William Yeung on 5/25/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

enum ProfileViewModel: Int, CaseIterable {
    case accountInfo
    case settings
    
    var description: String {
        switch self {
            case .accountInfo: return "Account Info"
            case .settings: return "Settings"
        }
    }
    
    var iconImageName: String {
        switch self {
            case .accountInfo: return "person.circle"
            case .settings: return "gear"
        }
    }
}
