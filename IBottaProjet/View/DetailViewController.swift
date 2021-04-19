//
//  DetailViewController.swift
//  IBottaProjet
//
//  Created by Mobile on 4/14/21.
//

import UIKit
import FaveButton

class DetailViewController: UIViewController, FaveButtonDelegate {
    
    // index of offer that is selected on collectionview.
    var numberOfOffer : Int?
    
    // Selected offer data
    var currentOffer : Offer?
    
    // delegation: weak reference to avoid cycle.
    weak var delegate:ViewController?
    
    // Thumbnail image
    var bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(imageLiteralResourceName: "default")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    // Current Value Label
    var currentValue : UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.contentMode = .scaleAspectFill
        il.text = "$1.00 cash back"
        il.font = UIFont(name: "AvenirNext-DemiBold", size: 20.0)
        il.textColor = UIColor(rgb: 0x4A4A4A)
        return il
    }()
    
    // Gray View for background
    var grayView : UIView = {
        let gv = UIView()
        gv.backgroundColor = UIColor(rgb: 0xDEDEDE)
        gv.contentMode = .scaleAspectFill
        gv.translatesAutoresizingMaskIntoConstraints = false
        gv.clipsToBounds = true
        gv.layer.cornerRadius = 5
        return gv
    }()
    
    // Name Value Label
    var nameValue : UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.contentMode = .scaleAspectFill
        il.text = "Arm and Hammer Launed..."
        il.font = UIFont(name: "AvenirNext-Regular", size: 20.0)
        il.textColor = UIColor(rgb: 0x4A4A4A)
        il.lineBreakMode = .byWordWrapping
        il.numberOfLines = 0
        return il
    }()
    
    // Description Value Label
    
    var descriptionValue : UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.contentMode = .scaleAspectFill
        il.text = "Any variety - 2 ct. pack or larger"
        il.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        il.textColor = UIColor(rgb: 0x4A4A4A)
        il.lineBreakMode = .byWordWrapping
        il.numberOfLines = 0
        return il
    }()
    
    // Terms Value Label
    
    var termsValue : UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.contentMode = .scaleAspectFill
        il.text = "Any variety - 2 ct. pack or larger"
        il.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        il.textColor = UIColor(rgb: 0x4A4A4A)
        il.lineBreakMode = .byWordWrapping
        il.numberOfLines = 0

        return il
    }()
    
    //Favorite Button. FaceButton SDK is used.
    
    var favoriteBtn : FaveButton = {
        let faveButton = FaveButton(

        frame: CGRect(x:0, y:0, width: 44, height: 44),
            faveIconNormal: UIImage(named: "heart")
        )
        faveButton.translatesAutoresizingMaskIntoConstraints = false
        return faveButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        //grayView.frame = CGRect(x: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.maxY, width: view.frame.width, height: view.frame.height/2)
        
        
        // Adding subviews.
        view.addSubview(grayView)
        grayView.addSubview(bg)
        view.addSubview(currentValue)
        view.addSubview(nameValue)
        view.addSubview(descriptionValue)
        view.addSubview(termsValue)
        view.addSubview(favoriteBtn)
        
        // set the delegate of favorite button.
        favoriteBtn.delegate = self
        
        // Set the constrains to the sub views.
        NSLayoutConstraint.activate([
            grayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            grayView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -6),
            grayView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 6),
            grayView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            //grayView.heightAnchor.constraint(equalTo: view.center.widthAnchor)

        ])
        
        NSLayoutConstraint.activate([
            bg.centerXAnchor.constraint(equalTo: grayView.centerXAnchor),
            bg.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
            bg.topAnchor.constraint(equalTo: grayView.topAnchor, constant: 0),
            bg.rightAnchor.constraint(equalTo: grayView.rightAnchor, constant: -6),
            bg.leftAnchor.constraint(equalTo: grayView.leftAnchor, constant: 6),
            bg.bottomAnchor.constraint(equalTo: grayView.bottomAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            currentValue.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            currentValue.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            currentValue.bottomAnchor.constraint(equalTo: nameValue.topAnchor, constant: -15),
            currentValue.lastBaselineAnchor.constraint(equalTo: favoriteBtn.firstBaselineAnchor)
        ])
        NSLayoutConstraint.activate([
            favoriteBtn.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            favoriteBtn.leftAnchor.constraint(equalTo: currentValue.rightAnchor, constant: 150),
            favoriteBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            favoriteBtn.bottomAnchor.constraint(equalTo: nameValue.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            nameValue.topAnchor.constraint(equalTo: currentValue.bottomAnchor, constant: 15),
            nameValue.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameValue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nameValue.bottomAnchor.constraint(equalTo: descriptionValue.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            descriptionValue.topAnchor.constraint(equalTo: nameValue.bottomAnchor, constant: 10),
            descriptionValue.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            descriptionValue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            descriptionValue.bottomAnchor.constraint(equalTo: termsValue.topAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            termsValue.topAnchor.constraint(equalTo: descriptionValue.bottomAnchor, constant: 5),
            termsValue.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            termsValue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // show the navigation bar.
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // Set the thumbnail image from cache.
        if let url = currentOffer?.url {
        bg.sd_setImage(with: URL(string : url), placeholderImage: UIImage(named: "default"))
        }
        // Set the texts of name, terms, current value, description.
        nameValue.text = currentOffer?.name
        descriptionValue.text = currentOffer?.description
        termsValue.text = currentOffer?.terms
        currentValue.text = currentOffer?.current_value
        
        // Set the favorite selected if it is selected before.
        favoriteBtn.setSelected(selected: currentOffer?.isFavorite ?? false, animated: false)
    }
    
    // On tapping favorite button
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
        // Call onFavorite method from the delegate.
        delegate?.onFavorite(isFavorite: selected, indexPath: numberOfOffer ?? -1)
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
