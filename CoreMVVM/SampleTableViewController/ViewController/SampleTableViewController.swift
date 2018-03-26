//
//  SampleTableViewController.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/23/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import UIKit

class SampleTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = ArticleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
//        viewModel.getAllArticle {
//            self.tableView.reloadData()
//        }
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension SampleTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfArticle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articles", for: indexPath) as? ArticleCell else { return UITableViewCell()}
        let article = viewModel.allArticle[indexPath.row]
        cell.configureCell(title: article.title! , body: article.body! )
        return cell
    }
}
