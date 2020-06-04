//
//  ArticleTableViewCell.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 28/04/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
     @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
