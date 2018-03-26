//
//  LoginViewModel.swift
//  CoreMVVM
//
//  Created by CyberK on 3/20/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import Foundation

class LoginViewModel{
    
    var userProfileInfo: UserProfile?
    
    private let model = LoginModel()
    
    func login(phoneNumber: String,completion: @escaping () -> Void){
        model.userSignIn(phoneNumber: phoneNumber) { (result, status, error) in
            
            if let response = result as? [String: Any] {
                //MARK: Get Userprofile
                if let json = response["userProfile"] as? [String:Any] {
                    self.userProfileInfo = UserProfile(JSON: json)!
                    completion()
                }
            }
            
        }
        
    }
    
}
