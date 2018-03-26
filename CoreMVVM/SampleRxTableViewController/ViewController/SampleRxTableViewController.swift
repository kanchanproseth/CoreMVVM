//
//  SampleRxTableViewController.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/23/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SampleRxTableViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = ArticleRxViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = nil
        tableView.dataSource = nil
        setupTableView()
    }
    
    func setupTableView(){
        
        viewModel.dataSource.bind(to: tableView.rx.items(cellIdentifier: "articles", cellType: ArticleCell.self)) { (row, article, cell) in
            cell.configureCell(title: article.title!, body: article.body!)
            }
            .disposed(by: disposeBag)
    }
    

}

