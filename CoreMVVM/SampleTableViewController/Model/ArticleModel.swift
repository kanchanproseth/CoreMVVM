//
//  ArticleModel.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/23/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ArticleModel {
    
    func getAllPosts(completion: @escaping (_ result: Any?, _ status: Bool?, _ error: Error?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                let result = response.result.value
                completion(result, true, nil)
                break
            case .failure(let error):
                completion(nil, false, error)
            }
        }
    }
}

struct Article: Mappable {
    var userId: String?
    var id: String?
    var title: String?
    var body: String?
    
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}


