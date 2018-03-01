//
//  IGTableViewCell.swift
//  Instagram
//
//  Created by David King on 2/28/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class IGTableViewCell: UITableViewCell {

    @IBOutlet weak var PostImage: UIImageView!
    
    @IBOutlet weak var CaptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
