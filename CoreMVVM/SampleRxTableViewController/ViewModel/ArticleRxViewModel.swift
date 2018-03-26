//
//  ArticleRxViewModel.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/26/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import Foundation
import RxSwift

class ArticleRxViewModel{
    
    var numberOfArticle = 0
    private let articles: Variable<[Article]> = Variable([])
    private let disposeBag = DisposeBag()
    
    // MARK: Outputs
    public var dataSource: Observable<[Article]>
    private let model = ArticleModel()
    init() {
        self.dataSource = self.articles.asObservable()
        self.getAllArticle()
    }
    
    
    func getAllArticle(){
            model.getAllPosts { (result, status, error) in
                if status! {
                    if let apiArticles = result as? [[String: Any]] {
                        //MARK: Get artile
                        self.numberOfArticle = apiArticles.count
                        for article in apiArticles{
                            let newArticle = Article(JSON: article)!
                            self.articles.value.append(newArticle)
                            
                        }
                    }
                }else{
//                    observer.onError(error!)
                }
            }
        
        
        
    }
    
}
