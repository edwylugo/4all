//
//  CommentTableViewCell.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var maintextLabel: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    static let xibName = "CommentViewCell"
    static let reuseIdentifier = "CommentViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        star5.isHidden = false
        star4.isHidden = false
        star3.isHidden = false
        star2.isHidden = false
        star1.isHidden = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setGrade(grade : Int){
        switch grade {
        case 0 :
            star5.isHidden = true
            star4.isHidden = true
            star3.isHidden = true
            star2.isHidden = true
            star1.isHidden = true
        case 1:
            star5.isHidden = true
            star4.isHidden = true
            star3.isHidden = true
            star2.isHidden = true
        case 2:
            star5.isHidden = true
            star4.isHidden = true
            star3.isHidden = true
        case 3 :
            star5.isHidden = true
            star4.isHidden = true
        case 4 :
            star5.isHidden = true
        default : break
        }
    }
    
}
