//
//  NetworkLayerWithMoya.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/26/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import Foundation
import Moya

enum API {
    
    // MARK: - Cameras
    case getAllPost
    case getAllPhoto
    case postArticle(title: String, body: String, userId: Int)
    
}

// 2:
extension API: TargetType {

    var headers: [String : String]? {
        return nil
    }
    
    
    // 3:
    var baseURL: URL { return URL(string: "https://jsonplaceholder.typicode.com")! }
    
    // 4:
    var path: String {
        switch self {
        case .getAllPost:
            return "/posts"
        case .getAllPhoto:
            return "/photos"
        case .postArticle:
            return "/posts"
        }
    }
    
    // 5:
    var method: Moya.Method {
        switch self {
        case .postArticle:
            return .post
        default:
            return .get
        }
    }
    
    // 6:
    var parameters: [String: Any]? {
        switch self {
        case .postArticle(let title, let body, let userId):
            var parameters = [String: Any]()
            parameters["title"] = title
            parameters["body"] = body
            parameters["userId"] = userId
            return parameters
        default:
            return nil
        }
    }
    
    // 7:
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
//    // 8:
    var sampleData: Data {
        return Data()
    }
    
    // 9:
    var task: Task {
        return .requestPlain
    }
}
