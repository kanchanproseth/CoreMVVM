//
//  ArticleMoyaModel.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/26/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

class MoyaModel {
    private let disposeBag = DisposeBag()
    let provider = MoyaProvider<API>()

    func getAllPost(completion: @escaping (_ result: Any?, _ status: Bool?, _ error: Error?) -> Void) {
        provider.request(.getAllPost) { (result) in
            switch result {
            case .success(let response):
                let result = try! response.mapJSON()
                completion(result, true, nil)
            case .failure(let error):
                completion(nil, false, error)
            }
        }
    }

    func getAllPostWithRxObjectMapper(completion: @escaping (_ result: Any?, _ status: Bool?, _ error: Error?) -> Void) {
        
        
        provider.rx.request(.getAllPost).subscribe { event in
            switch event {
            case let .success(response):
                let result = try! response.mapJSON()
                completion(result, true, nil)
            case let .error(error):
                completion(nil, false, error)
            }
        }.disposed(by: disposeBag)
    }
    
    func getAllPhotoWithRxObjectMapper(completion: @escaping (_ result: Any?, _ status: Bool?, _ error: Error?) -> Void) {
        provider.rx.request(.getAllPhoto).subscribe { event in
            switch event {
            case let .success(response):
                let result = try! response.mapJSON()
                completion(result, true, nil)
            case let .error(error):
                completion(nil, false, error)
            }
            }.disposed(by: disposeBag)
    }

}


struct ArticlePhoto: Mappable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
    
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        albumId <- map["albumId"]
        id <- map["id"]
        title <- map["title"]
        url <- map["url"]
        thumbnailUrl <- map["thumbnailUrl"]
    }
}
