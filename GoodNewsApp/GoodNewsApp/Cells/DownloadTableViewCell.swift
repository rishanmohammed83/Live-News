//
//  DownloadTableViewCell.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 02/06/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import UIKit

class DownloadTableViewCell: UITableViewCell {

    @IBOutlet weak var downloadTitle: UILabel!
    @IBOutlet weak var dowloadDescrption: UILabel!
    @IBOutlet weak var downloadNewsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
