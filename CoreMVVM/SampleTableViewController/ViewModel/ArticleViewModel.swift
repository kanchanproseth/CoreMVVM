//
//  ArticleViewModel.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/23/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import Foundation


class ArticleViewModel{
    
    var numberOfArticle = 0
    
    var allArticle = [Article]()
    
    private let model = ArticleModel()
    
    func getAllArticle(completion: @escaping () -> Void){
        model.getAllPosts { (result, status, error) in
            if let articles = result as? [[String: Any]] {
                //MARK: Get artile
                self.numberOfArticle = articles.count
                for article in articles{
                    let newArticle = Article(JSON: article)!
                    self.allArticle.append(newArticle)

                }
                completion()
            }
            
        }
        
    }
    
}
