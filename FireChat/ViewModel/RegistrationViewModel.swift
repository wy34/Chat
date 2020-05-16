//
//  RegistrationViewModel.swift
//  FireChat
//
//  Created by William Yeung on 5/16/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

struct RegistrationViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && userName?.isEmpty == false
    }
}
