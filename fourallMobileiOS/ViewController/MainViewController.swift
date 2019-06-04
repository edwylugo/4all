//
//  MainViewController.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit
import AlamofireImage
import MapKit
class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var imageViewCell : ImageViewTableViewCell!
    var optionsTableViewCell : OptionsTableViewCell!
    var mainViewModel : MainViewModel!
    
    @IBOutlet weak var loadingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        imageViewCell = Bundle.main.loadNibNamed(ImageViewTableViewCell.xibName, owner: nil, options: nil)?.first as? ImageViewTableViewCell
        optionsTableViewCell = Bundle.main.loadNibNamed(OptionsTableViewCell.xibName, owner: nil, options: nil)?.first as? OptionsTableViewCell
        
        tableView.register(UINib(nibName: CommentTableViewCell.xibName, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.reuseIdentifier)
        mainViewModel.delegate = self
        mainViewModel.requestTask()
        
        optionsTableViewCell.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + (mainViewModel.task?.comments.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            
            return imageViewCell
        case 1:
            return optionsTableViewCell
        default:
            let cel  = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.reuseIdentifier) as? CommentTableViewCell
            let comment = mainViewModel.task?.comments[indexPath.row-2]
            cel?.mainImage.af_setImage(withURL: URL(string: (comment?.urlPicture)!)!)
            cel?.maintextLabel.text = comment?.comment
            cel?.nameView.text = comment?.name
            cel?.subtitle.text = comment?.title
            cel?.setGrade(grade: comment?.grade ?? 0)
            return cel!
        }    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 315
        case 1:
            return 450
        default :
            return 100
        }
    }
    
}

extension MainViewController : MainViewModelProtocol{
    func didDownloadTask() {
        self.title = "\(mainViewModel.task?.city ?? "") - \(mainViewModel.task?.neighbourhood ?? "")"
        loadingView.isHidden = true
        imageViewCell.mainImageView.af_setImage(withURL: URL(string: (mainViewModel.task?.urlPicture)!)!)
        imageViewCell.iconView.af_setImage(withURL:  URL(string: (mainViewModel.task?.urlLogo)!)!)
        imageViewCell.titleLabel.text = mainViewModel.task?.title
        
        optionsTableViewCell.mainTextView.text = mainViewModel.task?.text
        optionsTableViewCell.streetNameLabel.text = mainViewModel.task?.address
        let initialLocation = CLLocation(latitude: (mainViewModel.task?.latitude)!, longitude:(mainViewModel.task?.longitude)!)
        let annotation = MKPointAnnotation()
        
        let region = MKCoordinateRegion(center: initialLocation.coordinate,
                                        latitudinalMeters: 300, longitudinalMeters: 300)
        optionsTableViewCell.mapView.setRegion(region, animated: true)
        annotation.coordinate = initialLocation.coordinate
        optionsTableViewCell.mapView.addAnnotation(annotation)
        tableView.reloadData()
    }
    
    
}


extension MainViewController : OptionsProtocol {
    func didTouchCall() {
        guard let number = URL(string: "tel://" + (mainViewModel.task?.phone ??  "")) else { return }
        UIApplication.shared.open(number)
    }
    
    func didTouchServices() {
        self.performSegue(withIdentifier: "services", sender: nil)
    }
    
    func didTouchComments() {
        if( mainViewModel.task?.comments.count ?? 0) > 0 {
            tableView.scrollToRow(at: IndexPath(row: 2, section: 0), at: .top, animated: true)
        }
    }
    
    func didTouchAddress() {
        let alert = UIAlertController(title: "Endereço", message: "\(mainViewModel.task?.address ?? "")", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated : true)
    }
    
    
}
