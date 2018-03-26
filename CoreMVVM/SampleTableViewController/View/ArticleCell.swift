
//
//  ArticleCell.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/23/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var bodyArticle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(title: String, body: String){
        self.title.text = title
        self.bodyArticle.text = body
    }

}
