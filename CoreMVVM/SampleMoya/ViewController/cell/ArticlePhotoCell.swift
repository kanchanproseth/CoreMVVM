//
//  ArticlePhotoCell.swift
//  CoreMVVM
//
//  Created by Cyberk on 3/26/18.
//  Copyright © 2018 CyberK. All rights reserved.
//

import UIKit
import Kingfisher

class ArticlePhotoCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var articleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String, thumbnailUrl: String, articleImgUrl: String){
        self.title.text = title
        if let thumbnailImageUrl = URL(string: thumbnailUrl) {
        thumbnailImage.kf.setImage(with: thumbnailImageUrl, placeholder: UIImage(named: "no_image"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
        if let articleImageUrl = URL(string: articleImgUrl) {
            articleImage.kf.setImage(with: articleImageUrl, placeholder: UIImage(named: "no_image"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }

}
