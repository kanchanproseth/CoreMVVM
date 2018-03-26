//
//  SampleMoyaViewController.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/26/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SampleMoyaViewController: UIViewController {
    let disposeBag = DisposeBag()
    private var viewModel = MoyaViewModel()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = nil
        tableView.dataSource = nil
        setupTableView()
    }

    func setupTableView() {
        viewModel.dataSourceWithPhoto.bind(to: tableView.rx.items(cellIdentifier: "articlePhoto", cellType: ArticlePhotoCell.self)) { (row, articlePhoto, cell) in
            cell.configureCell(title: articlePhoto.title!, thumbnailUrl: articlePhoto.thumbnailUrl!, articleImgUrl: articlePhoto.url!)
        }
            .disposed(by: disposeBag)
    }

}
