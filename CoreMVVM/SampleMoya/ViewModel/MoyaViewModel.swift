//
//  ArticleMoyaViewModel.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/26/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import Foundation
import RxSwift

class MoyaViewModel{
    
    
    var numberOfArticle = 0
    var numberOfPostWithPhoto = 0
    
    var allArticle = [Article]()
    private let model = MoyaModel()
    
    private let articles: Variable<[Article]> = Variable([])
    private let articlesPhoto: Variable<[ArticlePhoto]> = Variable([])
    
    private let disposeBag = DisposeBag()
    
    // MARK: Outputs
    public var dataSource: Observable<[Article]>
    
    public var dataSourceWithPhoto: Observable<[ArticlePhoto]>
    
    
    init() {
        self.dataSource = self.articles.asObservable()
        self.dataSourceWithPhoto = self.articlesPhoto.asObservable()
        self.getAllArticleRx()
        self.getAllPostWithPhotoRx()
    }
    
    func getAllArticle(completion: @escaping () -> Void){
        model.getAllPost { (result, status, error) in
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
    
    func getAllArticleRx(){
        model.getAllPostWithRxObjectMapper() { (result, status, error) in
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
                
            }
        }
    }
    
    func getAllPostWithPhotoRx(){
        model.getAllPhotoWithRxObjectMapper() { (result, status, error) in
            if status! {
                if let articlePhotos = result as? [[String: Any]] {
                    //MARK: Get artile
                    self.numberOfPostWithPhoto = articlePhotos.count
                    for articlePhoto in articlePhotos{
                        let newArticlePhoto = ArticlePhoto(JSON: articlePhoto)!
                        self.articlesPhoto.value.append(newArticlePhoto)
                        
                    }
                }
            }else{
                
            }
        }
    }
}
