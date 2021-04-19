//
//  CustomOfferCell.swift
//  IBottaProjet
//
//  Created by Mobile on 4/13/21.
//

import UIKit
import SDWebImage

class CustomOfferCell: UICollectionViewCell {
    
    // Create a thumbnail imageview
    var bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(imageLiteralResourceName: "default")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // Create a imageview for favorite icon.
    var fv: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // Create a UILabel of Current Value
    var bigText : UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.contentMode = .scaleAspectFill
        il.text = "$1.00 cash back"
        il.font = UIFont(name: "AvenirNext-DemiBold", size: 12.0)
        il.textColor = UIColor(rgb: 0x4A4A4A)
        return il
    }()
    
    // Create a UILabel of name.
    var smallText : UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.contentMode = .scaleAspectFill
        il.text = "Arm and Hammer Launed..."
        il.font = UIFont(name: "AvenirNext-Regular", size: 11.0)
        il.textColor = UIColor(rgb: 0x4A4A4A)
        return il
    }()
    
    // Create a UIView of gray background.
    var grayView : UIView = {
        let gv = UIView()
        gv.backgroundColor = UIColor(rgb: 0xDEDEDE)
        gv.contentMode = .scaleAspectFill
        gv.translatesAutoresizingMaskIntoConstraints = false
        gv.clipsToBounds = true
        gv.layer.cornerRadius = 5
        return gv
    }()
    
    // Prepare for reuse of Cell.
    override func prepareForReuse () {
      super.prepareForReuse ()
        fv.image = UIImage()
        bigText.text = ""
        smallText.text = ""
        
        // Cancel Current Image Load to avoid wrong image showed in the cell
        bg.sd_cancelCurrentImageLoad ()
    }
    
    // Initialization of Cell.
    override init(frame: CGRect){
        super.init(frame: .zero)

        // Add subviews.
        contentView.addSubview(grayView)
        grayView.addSubview(bg)
        grayView.addSubview(fv)
        contentView.addSubview(bigText)
        contentView.addSubview(smallText)
        
        // Set the constraint of UIView.
        NSLayoutConstraint.activate([
            grayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            grayView.rightAnchor.constraint(equalTo: self.rightAnchor),
            grayView.leftAnchor.constraint(equalTo: self.leftAnchor),
            grayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -34)

        ])
        
        // Set the constraint of thumbnail image.

        NSLayoutConstraint.activate([
            bg.topAnchor.constraint(equalTo: grayView.topAnchor, constant: 6),
            bg.rightAnchor.constraint(equalTo: grayView.rightAnchor, constant: -6),
            bg.leftAnchor.constraint(equalTo: grayView.leftAnchor, constant: 6),
            bg.bottomAnchor.constraint(equalTo: grayView.bottomAnchor, constant: -6)
        ])

        // Set the constraint of favorite icon.

        NSLayoutConstraint.activate([
            fv.rightAnchor.constraint(equalTo: grayView.rightAnchor, constant: -6),
            fv.bottomAnchor.constraint(equalTo: grayView.bottomAnchor, constant: -6),
            fv.widthAnchor.constraint(equalToConstant: 30),
            fv.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // Set the constraint of offer label.

        NSLayoutConstraint.activate([
            bigText.topAnchor.constraint(equalTo: grayView.bottomAnchor, constant: 8),
            bigText.leftAnchor.constraint(equalTo: self.leftAnchor),
            bigText.rightAnchor.constraint(equalTo: self.rightAnchor),
            bigText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14)
        ])
        
        // Set the constraint of name label.

        NSLayoutConstraint.activate([
            smallText.topAnchor.constraint(equalTo: bigText.bottomAnchor, constant: 3),
            smallText.leftAnchor.constraint(equalTo: self.leftAnchor),
            smallText.rightAnchor.constraint(equalTo: self.rightAnchor),
            smallText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented!")
    }
}

// Extend UIColor for setting RGB value.

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
