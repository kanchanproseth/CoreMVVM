//
//  LoginModel.swift
//  CoreMVVM
//
//  Created by CyberK on 3/20/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class LoginModel{
    
    func userSignIn(phoneNumber: String, completion: @escaping (_ result: Any?, _ status: Bool?, _ error: Error?) -> Void) {
        let urlString = BASER_URL + USER_URL + SIGN_IN
        let params = ["user": phoneNumber]
        Alamofire.request(urlString, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                print("\(response)")
                let result = response.result.value

                completion(result, true, nil)
                break
            case .failure(let error):
                completion(nil, false, error)
            }
        }
    }
}

struct UserProfile: Mappable {
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var profileUrl: String?
    var token: String?


    init?(map: Map) { }

    mutating func mapping(map: Map) {
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        phoneNumber <- map["phoneNumber"]
        profileUrl <- map["profileUrl"]
        token <- map["token"]
    }
}


