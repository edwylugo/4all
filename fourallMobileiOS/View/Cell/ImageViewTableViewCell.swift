//
//  ImageViewTableViewCel.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit

class ImageViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var iconView: UIImageView!
    
    static let xibName = "ImageViewCell"
    static let reuseIdentifier = "ImageViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
