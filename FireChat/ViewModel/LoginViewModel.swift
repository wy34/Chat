//
//  LoginViewModel.swift
//  FireChat
//
//  Created by William Yeung on 5/15/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
