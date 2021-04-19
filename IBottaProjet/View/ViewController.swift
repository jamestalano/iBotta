//
//  ViewController.swift
//  IBottaProjet
//
//  Created by Mobile on 4/13/21.
//

import UIKit
import SDWebImage

// Delegation function that is used for tapping favorite button.

protocol FavoriteOfferDelegate {
    func onFavorite(isFavorite : Bool, indexPath : Int)
}

class ViewController: UIViewController, UICollectionViewDelegate,FavoriteOfferDelegate {
    
    // url of JSON file that is uploaded.
    private let urlString = "https://api.jsonbin.io/b/6076e3a45b165e19f6200278"
    
    var offerCollectionView : UICollectionView?
    
    // Offer Data.
    private var offersArray = [Offer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        //Layout for collection view.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 12, bottom: 0, right: 12)
        let widthOfCell = (self.view.frame.size.width - 32)/2
        layout.itemSize = CGSize(width: widthOfCell, height: widthOfCell)
        layout.minimumLineSpacing = 24
        layout.minimumInteritemSpacing = 0
        
        offerCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        // register cell "OfferCell"
        offerCollectionView?.register(CustomOfferCell.self, forCellWithReuseIdentifier: "OfferCell")
        offerCollectionView?.backgroundColor = UIColor.white
        
        view.addSubview(offerCollectionView ?? UICollectionView())
        
        //Set datasource and delegate of Collectionview.
        offerCollectionView?.dataSource = self
        offerCollectionView?.delegate = self
        
        loadOffersJSON()         // Loading JSON Data
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide Navigation Bar.
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // Download JSON Data
    
    private func loadOffersJSON() {

        if let url = URL(string: urlString) {
            if (try? Data(contentsOf: url)) != nil {
                URLSession.shared.dataTask(with: url) { [self] data, response, error in
                      if let data = data {
                        
                        //Parse Json Data.
                        parse(json: data)
                        DispatchQueue.main.async {
                            
                            // Put JSON data to collection view.
                            self.offerCollectionView?.reloadData()
                        }
                       }
                   }.resume()
                }
            }
    }
    
    //Parse JSON data to codable Offer structure
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        do{
            let jsonOffers =  try decoder.decode([Offer].self, from: json)
            print(jsonOffers)
            self.offersArray = jsonOffers
            
        } catch{
            print("parsing failed")
        }
    }
    
    //On tap favorite button used in delegation.
    
    func onFavorite( isFavorite : Bool, indexPath : Int ) {
        if indexPath >= 0{
            offersArray[indexPath].isFavorite = isFavorite
            offerCollectionView?.reloadData()
        }
    }
}


// Implementation of collectionview data source.

extension ViewController: UICollectionViewDataSource{
    
    //Set cell for itemat.
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let offerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! CustomOfferCell
        offerCell.bigText.text = offersArray[indexPath.row].current_value
        offerCell.smallText.text = offersArray[indexPath.row].name
        
        // Put a thumbnail to the cell.
        
        if let url = offersArray[indexPath.row].url{
            offerCell.bg.sd_setImage(with: URL(string : url), placeholderImage: UIImage(named: "default"))   // Use SDWebImage for performance of downloading the images.
        }
        
        // Set a favorite image if it is selected.
        
        if let isFavorite = offersArray[indexPath.row].isFavorite, isFavorite {
            offerCell.fv.image = UIImage(named: "favorite")
        }
        
        return offerCell
    }
    
    // set number of collection view cells.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offersArray.count
    }
    
    // Implementation of when selecting itmes on collection view.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailView = DetailViewController()
        
        // Delegate the offer data.
        
        detailView.view.backgroundColor = UIColor.white
        detailView.numberOfOffer = indexPath.row
        detailView.currentOffer = offersArray[indexPath.row]
        detailView.delegate = self
        
        // Push Detail View.
        self.navigationController?.pushViewController(detailView, animated: true)
    }

}
