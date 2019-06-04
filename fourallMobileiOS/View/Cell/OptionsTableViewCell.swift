//
//  OptionsTableViewCell.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit
import MapKit

protocol  OptionsProtocol : class {
    func didTouchCall()
    func didTouchServices()
    func didTouchComments()
    func didTouchAddress()
}
class OptionsTableViewCell: UITableViewCell {
    static let xibName = "OptionsViewCell"
    static let reuseIdentifier = "OptionsViewCell"
    weak var delegate : OptionsProtocol?
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var servicesButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var streetNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoritesButton.alignImageAndTitleVertically()
        // favoritesButton.imageView?.contentMode = .scaleAspectFit
        commentButton.alignImageAndTitleVertically()
        addressButton.alignImageAndTitleVertically()
        servicesButton.alignImageAndTitleVertically()
        callButton.alignImageAndTitleVertically()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func callButtonTouch(_ sender: Any) {
        delegate?.didTouchCall()
    }
    
    @IBAction func servicesButtonTouch(_ sender: Any) {
        delegate?.didTouchServices()
    }
    
    @IBAction func addressButtonTouch(_ sender: Any) {
        delegate?.didTouchAddress()
    }
    
    @IBAction func commentButtonTouch(_ sender: Any) {
        delegate?.didTouchComments()
    }
    
    @IBAction func favoritesButtonTouch(_ sender: Any) {
    }
    
}

